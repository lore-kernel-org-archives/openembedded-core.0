Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jingdong.Lu@windriver.com>) id 1PxI97-0002oy-8E
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 13:05:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p299jWuX008007
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2011 01:45:32 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 9 Mar 2011 01:45:31 -0800
Message-ID: <4D774C36.3090807@windriver.com>
Date: Wed, 9 Mar 2011 17:45:26 +0800
From: Lu Jingdong <jingdong.lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Nitin A Kamble <nitin.a.kamble@intel.com>
References: <cover.1299633840.git.nitin.a.kamble@intel.com>
	<33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
In-Reply-To: <33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
X-Originating-IP: [128.224.162.205]
X-Mailman-Approved-At: Wed, 09 Mar 2011 13:08:40 +0100
Cc: poky@yoctoproject.org, Khem, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.so.6
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
X-List-Received-Date: Wed, 09 Mar 2011 12:05:42 -0000
Content-Type: multipart/alternative;
	boundary="------------080306050505060608020008"

--------------080306050505060608020008
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2011 09:26 AM, Nitin A Kamble wrote:
>   .../recipes-devtools/gcc/gcc-configure-runtime.inc |    3 +++
>   meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-
>   2 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> index 6cc11e2..2d214af 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> @@ -1,5 +1,8 @@
>   require gcc-configure-common.inc
>
> +CXXFLAGS = "${@oe_filter_out('-fvisibility-inlines-hidden',
> +'${CXXFLAGS}', d)}"
> +
I think it should be

CXXFLAGS*:=*  "${@oe_filter_out('-fvisibility-inlines-hidden',
'${CXXFLAGS}', d)}"

otherwise it will give the following error log.
NOTE: Error expanding variable CXXFLAGS###############################################################                                 | ETA:  00:00:00
ERROR: Error parsing xxx.../xxx.bb: variable CXXFLAGS references itself!

It is ok in python, but bitbake/lib/bb/data_smart.py will check it and it will cause error.

>   EXTRA_OECONF_PATHS = " \
>       --with-local-prefix=${STAGING_DIR_TARGET}${prefix} \
>       --with-gxx-include-dir=${includedir}/c++/ \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> index 093f9bf..c1e680d 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> @@ -1,4 +1,4 @@
> -PR = "r2"
> +PR = "r3"
>
>   require gcc-${PV}.inc
>   require gcc-configure-runtime.inc


-- 
Lu Jingdong
jingdong.lu@windriver.com
China, Wind River


--------------080306050505060608020008
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#ffffff" text="#000000">
    <tt>On 03/09/2011 09:26 AM, Nitin A Kamble wrote:</tt>
    <blockquote
cite="mid:33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com"
      type="cite">
      <pre wrap=""> .../recipes-devtools/gcc/gcc-configure-runtime.inc |    3 +++
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 6cc11e2..2d214af 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -1,5 +1,8 @@
 require gcc-configure-common.inc
 
+CXXFLAGS = "${@oe_filter_out('-fvisibility-inlines-hidden',
+'${CXXFLAGS}', d)}" 
+
</pre>
    </blockquote>
    <tt>I think it should be </tt><br>
    <pre wrap="">CXXFLAGS <b>:=</b> "${@oe_filter_out('-fvisibility-inlines-hidden',
'${CXXFLAGS}', d)}" 

otherwise it will give the following error log.
NOTE: Error expanding variable CXXFLAGS###############################################################                                 | ETA:  00:00:00
ERROR: Error parsing xxx.../xxx.bb: variable CXXFLAGS references itself!

It is ok in python, but bitbake/lib/bb/data_smart.py will check it and it will cause error.
</pre>
    <blockquote
cite="mid:33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com"
      type="cite">
      <pre wrap=""> EXTRA_OECONF_PATHS = " \
     --with-local-prefix=${STAGING_DIR_TARGET}${prefix} \
     --with-gxx-include-dir=${includedir}/c++/ \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
index 093f9bf..c1e680d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 require gcc-${PV}.inc
 require gcc-configure-runtime.inc
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Lu Jingdong
<a class="moz-txt-link-abbreviated" href="mailto:jingdong.lu@windriver.com">jingdong.lu@windriver.com</a>
China, Wind River</pre>
  </body>
</html>

--------------080306050505060608020008--
