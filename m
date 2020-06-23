Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1829.1592953128533830257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 15:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05NMwlfv009376
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 15:58:47 -0700 (PDT)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 23 Jun 2020 15:58:47 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] Improving setuptools performance in Python
Date: Tue, 23 Jun 2020 18:58:45 -0400
Message-ID: <20200623225846.5534-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As explained in https://github.com/pypa/setuptools/issues/510, the 
pkg_resources module in setuptools is very slow to initialize scripts 
due to how it scans the Python path for each module that would import 
pkg_resources. My understanding of upstream Python's response is that 
as of 3.7 and later, importlib.resources is available for replacing 
this functionality in new scripts, but existing code that uses 
pkg_resources will still have to be re-written to use it (or something 
like python3-fastentrypoints. 

I've done some performance testing with this patch using the following,
very simple steps:

1) Add "IMAGE_INSTALL_append = " python3-setuptools" to local.conf;

2) bitbake core-image-full-cmdline

3) mkdir -p test/minimal;

4) In test/minimal/__init__.py, add:

def main():
    print('hello world')

if __name__ == '__main__':
    main()

5) In test/setup.py:

from setuptools import setup, find_packages

setup(
name='minimal',
version='0.1',
python_requires='>=3.4',
packages=['minimal'],
entry_points={ 'console_scripts': [ 'minimal = minimal:main' ] },
)

6) Run "python3 setup.py install"

7) Run "time /usr/bin/minimal"

8) Note the drastic differences in run time, e.g. with
core-image-full-cmdline:

core-image-full-cmdline, WITHOUT setuptools ScriptWriter patch:

root@qemux86-64:~# time /usr/bin/minimal
hello world

real    0m0.198s
user    0m0.174s
sys     0m0.023s

core-image-full-cmdline, WITH setuptools ScriptWriter patch:

root@qemux86-64:~# time /usr/bin/minimal
hello world

real    0m0.034s
user    0m0.024s
sys     0m0.010s

I've also tried to ensure that this has no adverse effects on the larger
python ecosystem in Yocto, by running ptests on all modules in
meta-python that have ptests available and use setuptools, with this
patch installed. I saw no failures related to setuptools, although it is
still possible that this could have unforeseen consequences on other
modules.

Finally, some (truncated) profiling comparisons to emphasize the gains
in performance, using the same example module before and after the patch. 
There are three orders of magnitude difference in the number of calls 
required, including much more recursion. What is most apparent from 
these profiling results is how much more time the unpatched version 
spends parsing entry points when that effort isn't required to achieve
the same end. As can be seen from the simple example used here, the 
time savings at initialization are significant enough even for tiny
scripts that this fix should be incorporated in the project at the 
setuptools level, rather than requiring manual application, or 
modification of existing scripts on the user's end.

WITHOUT PATCH:

         134641 function calls (130543 primitive calls) in 0.723 seconds

   Ordered by: cumulative time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
     88/1    0.002    0.000    0.723    0.723 {built-in method builtins.exec}
        1    0.000    0.000    0.723    0.723 minimal:3(<module>)
    100/2    0.002    0.000    0.704    0.352 <frozen importlib._bootstrap>:986(_find_and_load)
    100/2    0.002    0.000    0.703    0.352 <frozen importlib._bootstrap>:956(_find_and_load_unlocked)
     93/2    0.002    0.000    0.700    0.350 <frozen importlib._bootstrap>:650(_load_unlocked)
     67/1    0.001    0.000    0.699    0.699 <frozen importlib._bootstrap_external>:777(exec_module)
    115/1    0.000    0.000    0.698    0.698 <frozen importlib._bootstrap>:211(_call_with_frames_removed)
        1    0.000    0.000    0.698    0.698 __init__.py:2(<module>)
    30/19    0.000    0.000    0.445    0.023 {built-in method builtins.__import__}
       82    0.002    0.000    0.372    0.005 re.py:289(_compile)
       75    0.000    0.000    0.369    0.005 re.py:250(compile)
       73    0.002    0.000    0.367    0.005 sre_compile.py:759(compile)
        1    0.000    0.000    0.262    0.262 requirements.py:4(<module>)
       73    0.001    0.000    0.259    0.004 sre_parse.py:937(parse)
   308/73    0.007    0.000    0.255    0.003 sre_parse.py:435(_parse_sub)
   457/77    0.072    0.000    0.253    0.003 sre_parse.py:493(_parse)
  283/280    0.009    0.000    0.222    0.001 {built-in method builtins.__build_class__}
      9/7    0.000    0.000    0.159    0.023 <frozen importlib._bootstrap>:613(_load_backward_compatible)
        6    0.000    0.000    0.159    0.026 __init__.py:35(load_module)
        1    0.001    0.001    0.145    0.145 pyparsing.py:26(<module>)
       26    0.001    0.000    0.137    0.005 pyparsing.py:2779(__init__)
       73    0.001    0.000    0.104    0.001 sre_compile.py:598(_code)
        1    0.000    0.000    0.097    0.097 parser.py:5(<module>)
        1    0.000    0.000    0.095    0.095 feedparser.py:5(<module>)
        1    0.000    0.000    0.095    0.095 specifiers.py:4(<module>)
   770/73    0.032    0.000    0.091    0.001 sre_compile.py:71(_compile)
        1    0.000    0.000    0.086    0.086 _policybase.py:1(<module>)
    11488    0.049    0.000    0.086    0.000 sre_parse.py:254(get)
        1    0.000    0.000    0.083    0.083 specifiers.py:275(Specifier)
        1    0.000    0.000    0.073    0.073 pyparsing.py:5399(pyparsing_common)
       98    0.003    0.000    0.063    0.001 <frozen importlib._bootstrap>:890(_find_spec)
        1    0.000    0.000    0.058    0.058 utils.py:5(<module>)

WITH PATCH:

         300 function calls (299 primitive calls) in 0.003 seconds

   Ordered by: cumulative time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
      2/1    0.000    0.000    0.003    0.003 {built-in method builtins.exec}
        1    0.000    0.000    0.003    0.003 minimal:2(<module>)
        1    0.000    0.000    0.003    0.003 <frozen importlib._bootstrap>:986(_find_and_load)
        1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap>:956(_find_and_load_unlocked)
        1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap>:890(_find_spec)
        1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap_external>:1334(find_spec)
        1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap_external>:1302(_get_spec)
        2    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:1431(find_spec)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap>:650(_load_unlocked)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1479(_fill_cache)
       18    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:62(_path_join)
        1    0.000    0.000    0.000    0.000 {built-in method posix.listdir}
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:777(exec_module)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:849(get_code)
       11    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:90(_path_is_mode_type)
        9    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:99(_path_isfile)
       15    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:80(_path_stat)
       18    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:64(<listcomp>)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:549(module_from_spec)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:477(_init_module_attrs)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1265(_path_importer_cache)
       15    0.000    0.000    0.000    0.000 {built-in method posix.stat}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:294(cache_from_source)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1252(_path_hooks)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:376(cached)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:424(_get_cached)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1520(path_hook_for_FileFinder)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:969(get_data)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:147(__enter__)
       38    0.000    0.000    0.000    0.000 {method 'rstrip' of 'str' objects}
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1394(__init__)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:104(_path_isdir)

Trevor Gamblin (1):
  python3-setuptools: patch entrypoints for performance boost

 .../python/python-setuptools.inc              |  4 +-
 ...nt-usr-bin-wrappers-signoff-included.patch | 60 +++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch

-- 
2.24.1

