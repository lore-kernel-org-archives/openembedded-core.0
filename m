Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Scme7-0005hZ-4i
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 02:01:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q57NpCdI005647
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jun 2012 16:51:12 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 7 Jun 2012 16:51:11 -0700
Message-ID: <4FD13E6A.5050203@windriver.com>
Date: Fri, 8 Jun 2012 07:51:06 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339051007.git.liezhi.yang@windriver.com>
	<5f256583bca8c2d4225c379cc9b7ca23f374dcdc.1339051007.git.liezhi.yang@windriver.com>
	<20120607093144.GF3140@jama.jama.net>
In-Reply-To: <20120607093144.GF3140@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: do_fetch failed since no checksum specified
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
X-List-Received-Date: Fri, 08 Jun 2012 00:01:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/07/2012 05:31 PM, Martin Jansa wrote:
> On Thu, Jun 07, 2012 at 05:24:39PM +0800, Robert Yang wrote:
>> * We use meta/recipes-devtools/opkg/opkg_svn.bb by default, the
>>    opkg_0.1.8.bb failed since no checksum specified.
>>
>> * The add_vercmp.patch in both opkg/ and opkg-0.1.8/, remove the one
>>    in opkg-0.1.8/
>>
>> This patch doesn't impact the output, so I think that we don't have to
>> increment the PR.
>>
>> [YOCTO #2498]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   .../opkg/opkg-0.1.8/add_vercmp.patch               |   36 --------------------
>>   meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    5 ++-
>>   2 files changed, 4 insertions(+), 37 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch b/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
>> deleted file mode 100644
>> index c3396d5..0000000
>> --- a/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -Upstream-Status: Inappropriate [other]
>> -
>> -Index: trunk/libopkg/opkg.c
>> -===================================================================
>> ---- trunk.orig/libopkg/opkg.c	2010-01-26 20:32:19.000000000 +0000
>> -+++ trunk/libopkg/opkg.c	2010-01-26 20:40:34.000000000 +0000
>> -@@ -876,3 +876,18 @@
>> -
>> - 	return ret;
>> - }
>> -+
>> -+int
>> -+opkg_compare_versions (const char *ver1, const char *ver2)
>> -+{
>> -+  pkg_t *pkg1, *pkg2;
>> -+
>> -+  pkg1 = pkg_new();
>> -+  pkg2 = pkg_new();
>> -+
>> -+  parse_version(pkg1, ver1);
>> -+  parse_version(pkg2, ver2);
>> -+
>> -+  return pkg_compare_versions(pkg1, pkg2);
>> -+}
>> -+
>> -Index: trunk/libopkg/opkg.h
>> -===================================================================
>> ---- trunk.orig/libopkg/opkg.h	2010-01-26 20:32:19.000000000 +0000
>> -+++ trunk/libopkg/opkg.h	2010-01-26 20:35:19.000000000 +0000
>> -@@ -58,4 +58,6 @@
>> -
>> - int opkg_repository_accessibility_check(void);
>> -
>> -+int opkg_compare_versions (const char *ver1, const char *ver2);
>> -+
>> - #endif /* OPKG_H */
>> diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
>> index c206b37..785b6ca 100644
>> --- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
>> +++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
>> @@ -1,8 +1,11 @@
>>   require opkg.inc
>>
>>   SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
>> -           file://add_vercmp.patch \
>> +           file://opkg/add_vercmp.patch \
>
> is this "opkg/" really needed?
>

This seems strange, I did see a WARNING yesterday which said that it can't
find opkg-0.1.8/add_vercmp.patch after I removed opkg-0.1.8/add_vercmp.patch,
I was curious why this happened, I guessed that this was because there was a
opkg-0.1.8/ directory, and I was thinking whether this was a bug of do_fetch,
but today, I can't reproduce the WARNING, even I added the
opkg-0.1.8/add_vercmp.patch back, built opkg, removed the
opkg-0.1.8/add_vercmp.patch, built opkg again.

I removed the "opkg/" and pushed the commit to:

   git://git.pokylinux.org/poky-contrib robert/opkg_sum
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/opkg_sum

// Robert

>>              file://headerfix.patch \
>>             "
>>
>> +SRC_URI[md5sum] = "c714ce0e4863bf1315e3b6913ffe3299"
>> +SRC_URI[sha256sum] = "ff94bf30bd662d49c4b5057e3a0818d062731adaa555d59abd677ec32a3c1c60"
>> +
>>   PR = "${INC_PR}.0"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


