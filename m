Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SB7V3-0007uZ-5D
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:38:01 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 28770F8126F; Fri, 23 Mar 2012 10:29:06 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1AF90F8126E;
	Fri, 23 Mar 2012 10:28:55 -0600 (MDT)
Message-ID: <4F6CA4C7.3080600@mlbassoc.com>
Date: Fri, 23 Mar 2012 10:28:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
	<1332516428-9675-3-git-send-email-gary@mlbassoc.com>
	<20120323153553.GJ3879@jama.jama.net>
	<20120323154819.GK3879@jama.jama.net>
	<4F6CA27B.5050800@mlbassoc.com>
In-Reply-To: <4F6CA27B.5050800@mlbassoc.com>
Subject: Re: [PATCH 2/2] python: Fix minimal packaging dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 16:38:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-23 10:19, Gary Thomas wrote:
> On 2012-03-23 09:48, Martin Jansa wrote:
>> On Fri, Mar 23, 2012 at 04:35:53PM +0100, Martin Jansa wrote:
>>> On Fri, Mar 23, 2012 at 09:27:08AM -0600, Gary Thomas wrote:
>>>> If you install the top-level python package only on a minimal
>>>> system which has no other python packages installed then python
>>>> is not functional at all. Without any extra packages installed
>>>> this error is seen:
>>>> # python
>>>> Traceback (most recent call last):
>>>> File "/usr/lib/python2.7/site.py", line 64, in<module>
>>>> import traceback
>>>> ImportError: No module named traceback
>>>>
>>>> Installing python-lang only partly fixes the problem as this
>>>> error still exists:
>>>> # python
>>>> Traceback (most recent call last):
>>>> File "/usr/lib/python2.7/site.py", line 569, in<module>
>>>> main()
>>>> File "/usr/lib/python2.7/site.py", line 551, in main
>>>> known_paths = addusersitepackages(known_paths)
>>>> File "/usr/lib/python2.7/site.py", line 278, in addusersitepackages
>>>> user_site = getusersitepackages()
>>>> File "/usr/lib/python2.7/site.py", line 253, in getusersitepackages
>>>> user_base = getuserbase() # this will also set USER_BASE
>>>> File "/usr/lib/python2.7/site.py", line 243, in getuserbase
>>>> USER_BASE = get_config_var('userbase')
>>>> File "/usr/lib/python2.7/sysconfig.py", line 520, in get_config_var
>>>> return get_config_vars().get(name)
>>>> File "/usr/lib/python2.7/sysconfig.py", line 400, in get_config_vars
>>>> import re
>>>> ImportError: No module named re
>>>>
>>>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>>>> ---
>>>> meta/recipes-devtools/python/python_2.7.2.bb | 3 ++-
>>>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
>>>> index 8111b31..f1ba42d 100644
>>>> --- a/meta/recipes-devtools/python/python_2.7.2.bb
>>>> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
>>>> @@ -1,6 +1,6 @@
>>>> require python.inc
>>>> DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
>>>> -PR = "${INC_PR}.8"
>>>> +PR = "${INC_PR}.9"
>>>>
>>>> DISTRO_SRC_URI ?= "file://sitecustomize.py"
>>>> DISTRO_SRC_URI_linuxstdbase = ""
>>>> @@ -123,6 +123,7 @@ py_package_preprocess () {
>>>> require python-${PYTHON_MAJMIN}-manifest.inc
>>>
>>> This should be fixed probably in
>>> scripts/contrib/python/generate-manifest-2.7.py
>>>
>>>>
>>>> # manual dependency additions
>>>> +RRDEPENDS_${PN} = "${PN}-lang ${PN}-re"
>>>
>>> And here is typo, how did you test this change?
>>
>> And also notice that there is no ${PN} in PACKAGES, so by "top-level
>> python package" you mean python-core right?
>
> Yes. As far as my testing, it got muddled with something else and
> what I've proposed doesn't help, sorry. I'm looking into how to fix
> this via the generate-manifest script and will send a different patch
> shortly [I hope].

Sadly, my attempt to fix this doesn't work.  Here's what I tried, but
it has no effect:

diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 85ca353..bde7db9 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -160,7 +160,7 @@ if __name__ == "__main__":
      # Parameters: revision, name, description, dependencies, filenames
      #

-    m.addPackage( "${PN}-core", "Python Interpreter and core modules (needed!)", "",
+    m.addPackage( "${PN}-core", "Python Interpreter and core modules (needed!)", "${PN}-lang ${PN}-re",
      "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
      "genericpath.* getopt.* linecache.* new.* " +
      "os.* posixpath.* struct.* " +
@@ -276,7 +276,7 @@ if __name__ == "__main__":
      m.addPackage( "${PN}-json", "Python JSON Support", "${PN}-core ${PN}-math ${PN}-re",
      "json lib-dynload/_json.so" ) # package

-    m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "${PN}-core",
+    m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "",
      "lib-dynload/_bisect.so lib-dynload/_collections.so lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_funct
      "lib-dynload/array.so lib-dynload/itertools.so lib-dynload/operator.so lib-dynload/parser.so " +
      "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* rep
@@ -322,7 +322,7 @@ if __name__ == "__main__":
      m.addPackage( "${PN}-profile", "Python Basic Profiling Support", "${PN}-core ${PN}-textutils",
      "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )

-    m.addPackage( "${PN}-re", "Python Regular Expression APIs", "${PN}-core",
+    m.addPackage( "${PN}-re", "Python Regular Expression APIs", "",
      "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is builtin

      m.addPackage( "${PN}-readline", "Python Readline Support", "${PN}-core",

>
> Query: if I change the script, should I also bum PR in this recipe?
>
>

For now, I'll just have to install python-lang and python-re manually...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


