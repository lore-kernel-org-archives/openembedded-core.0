Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.44524.1589816173679886611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 08:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=l6O86R14;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.135] (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 93E8020B717B;
	Mon, 18 May 2020 08:36:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 93E8020B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1589816172;
	bh=V9tZup18N1uexb1BsDEdNCc5KYU04FwLLG81oyZJjcE=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=l6O86R14rAHgcQ2uoRV44rRl2LzsImv9osA4UysRJ3nHtb2Cf5RDDBM0z2Vqkzu/A
	 SMwgV3mooU/9VrLPtb/3TIy5X5I1o+QiHODCO1MNGBPwMogF523jxGyItVutsuHUaM
	 MXTk+LJKn4ksE2Dh3IOxBsPBn7HakhBQRPFPTKlI=
Subject: Re: [OE-core] [PATCH] python3: add pydoc and urllib to core
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200518073201.23647-1-mingli.yu@windriver.com>
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
Message-ID: <777387e3-f259-c635-77f1-1edb9b1704ff@linux.microsoft.com>
Date: Mon, 18 May 2020 08:36:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518073201.23647-1-mingli.yu@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------B371D26F8FD4A74C7B1E4BD9"
Content-Language: en-US

--------------B371D26F8FD4A74C7B1E4BD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Mingli,

Did you happen to run the create_manifest task after modifying the 
manifest to make sure that runtime dependencies are still valid?


Thanks

Alejandro

On 5/18/20 12:32 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add pydoc and urllib to core to fix below error:
>   # python3
>   >>> help()
>   Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
>   import pydoc
>   ModuleNotFoundError: No module named 'pydoc'
>   File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
>   import urllib.parse
>   ModuleNotFoundError: No module named 'urllib'
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../python/python3/python3-manifest.json      | 24 +++++--------------
>   meta/recipes-devtools/python/python3_3.8.2.bb |  3 +--
>   2 files changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 3bcc9b8662..808eadb8f6 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -203,6 +203,7 @@
>               "${bindir}/python${PYTHON_MAJMIN}",
>               "${bindir}/python${PYTHON_MAJMIN}.real",
>               "${bindir}/python3",
> +            "${bindir}/pydoc*",
>               "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>               "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>               "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
> @@ -289,6 +290,7 @@
>               "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
>               "${libdir}/python${PYTHON_MAJMIN}/platform.py",
>               "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>               "${libdir}/python${PYTHON_MAJMIN}/re.py",
>               "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
>               "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
> @@ -313,8 +315,11 @@
>               "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
>               "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>               "${libdir}/python${PYTHON_MAJMIN}/types.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>               "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
>               "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
>           ],
>           "cached": [
> @@ -363,6 +368,7 @@
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
> @@ -798,7 +804,6 @@
>               "plistlib",
>               "pprint",
>               "profile",
> -            "pydoc",
>               "resource",
>               "shell",
>               "smtpd",
> @@ -857,8 +862,6 @@
>               "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
>               "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
>               "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/urllib",
> -            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
>           ],
>           "cached": [
> @@ -989,21 +992,6 @@
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
>           ]
>       },
> -    "pydoc": {
> -        "summary": "Python interactive help support",
> -        "rdepends": [
> -            "core",
> -            "netclient"
> -        ],
> -        "files": [
> -            "${bindir}/pydoc*",
> -            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
> -        ],
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
> -        ]
> -    },
>       "resource": {
>           "summary": "Python resource control interface",
>           "rdepends": [
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
> index a4a16fd495..36aa54ba6c 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -318,7 +318,6 @@ RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
>   FILES_${PN} = ""
>   RPROVIDES_${PN}-modules = "${PN}"
>   
> -FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
>   FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
>   
>   # provide python-pyvenv from python3-venv
> @@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
>   
>   # catch all the rest (unsorted)
>   PACKAGES += "${PN}-misc"
> -RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
> +RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pickle python3-audio"
>   RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
>   RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
>   FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
>
> 

--------------B371D26F8FD4A74C7B1E4BD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Mingli,</p>
    <p>Did you happen to run the create_manifest task after modifying
      the manifest to make sure that runtime dependencies are still
      valid?</p>
    <p><br>
    </p>
    <p>Thanks</p>
    <p>Alejandro<br>
    </p>
    <div class="moz-cite-prefix">On 5/18/20 12:32 AM, Yu, Mingli wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200518073201.23647-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

Add pydoc and urllib to core to fix below error:
 # python3
 &gt;&gt;&gt; help()
 Traceback (most recent call last):
 File "&lt;stdin&gt;", line 1, in &lt;module&gt;
 File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
 import pydoc
 ModuleNotFoundError: No module named 'pydoc'
 File "/usr/lib64/python3.8/pydoc.py", line 72, in &lt;module&gt;
 import urllib.parse
 ModuleNotFoundError: No module named 'urllib'

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 .../python/python3/python3-manifest.json      | 24 +++++--------------
 meta/recipes-devtools/python/python3_3.8.2.bb |  3 +--
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 3bcc9b8662..808eadb8f6 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -203,6 +203,7 @@
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
             "${bindir}/python3",
+            "${bindir}/pydoc*",
             "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
@@ -289,6 +290,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
             "${libdir}/python${PYTHON_MAJMIN}/re.py",
             "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
@@ -313,8 +315,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
             "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
             "${libdir}/python${PYTHON_MAJMIN}/types.py",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
         ],
         "cached": [
@@ -363,6 +368,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
@@ -798,7 +804,6 @@
             "plistlib",
             "pprint",
             "profile",
-            "pydoc",
             "resource",
             "shell",
             "smtpd",
@@ -857,8 +862,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "cached": [
@@ -989,21 +992,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
         ]
     },
-    "pydoc": {
-        "summary": "Python interactive help support",
-        "rdepends": [
-            "core",
-            "netclient"
-        ],
-        "files": [
-            "${bindir}/pydoc*",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
-        ]
-    },
     "resource": {
         "summary": "Python resource control interface",
         "rdepends": [
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a4a16fd495..36aa54ba6c 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -318,7 +318,6 @@ RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
 FILES_${PN} = ""
 RPROVIDES_${PN}-modules = "${PN}"
 
-FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
 
 # provide python-pyvenv from python3-venv
@@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
+RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pickle python3-audio"
 RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
 RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B371D26F8FD4A74C7B1E4BD9--
