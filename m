Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 953156E413
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 09:14:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2E9EVng022080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Mar 2014 02:14:31 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Fri, 14 Mar 2014 02:14:31 -0700
Message-ID: <5322C873.6020709@windriver.com>
Date: Fri, 14 Mar 2014 17:14:27 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
	<5321803B.90400@windriver.com>
	<3035449.StOc9XfpzV@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <3035449.StOc9XfpzV@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 09:14:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/13/2014 06:01 PM, Paul Eggleton wrote:
> On Thursday 13 March 2014 17:54:03 Chong Lu wrote:
>> On 03/06/2014 06:04 PM, Burton, Ross wrote:
>>> On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
>>>> +PACKAGES += "dbus-ptest"
>>>> +ALLOW_EMPTY_${PN}-ptest = "1"
>>>> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs',
>>>> 'dbus-test-ptest', 'dbus-test', d)}"
>>> Clearly I wasn't thinking clearly last week.  You can't check
>>> IMAGE_FEATURES in a non-image recipe so this isn't a good solution.
>> Do you have any suggestion about this issue?
>> If we don't check IMAGE_FEATURES, I have no way to resolve this problem
>> that only build but not install ptest. I'm very confused.
> This should check DISTRO_FEATURES, not IMAGE_FEATURES. Assuming ptest is in
> DISTRO_FEATURES, even if ptest is not in IMAGE_FEATURES it doesn't matter if
> the dependency between dbus-ptest and dbus-ptest-ptest exists because dbus-
> ptest itself shouldn't be in the image, so dbus-ptest-ptest shouldn't be
> pulled in either. Does that make sense?
>
> Cheers,
> Paul
>
Hi Paul,

Thanks for your reply!
But I still have a question.

I try to following way:

# git diff
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb 
b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index bc260de..50dfe54 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -9,6 +9,7 @@ DEPENDS = "python-pygobject dbus dbus-glib"

  RDEPENDS_${PN} += "make"
  RDEPENDS_${PN}-dev = ""
+ALLOW_EMPTY_${PN} = "1"

  SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
             file://tmpdir.patch \
diff --git a/meta/recipes-core/dbus/dbus.inc 
b/meta/recipes-core/dbus/dbus.inc
index 677ff78..ba7f3cb 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -6,7 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
  DEPENDS = "expat virtual/libintl"
-RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 
'dbus-ptest-ptest', '', d)}"
+RDEPENDS_dbus = "dbus-ptest"
  RDEPENDS_dbus_class-native = ""
  RDEPENDS_dbus_class-nativesdk = ""

In local.conf, I set following thing:
+EXTRA_IMAGE_FEATURES += "ptest-pkgs"
+CORE_IMAGE_EXTRA_INSTALL += "dbus"

Then, I run "bitbake core-image-minimal" command.
Finally, I start target through runqemu.
But dbus ptest is not installed.

I alway try to many ways to fix this issue, but the result is not 
satisfactory.

I think the point of this defect is the following question:
If we only want to build dbus-ptest (generate dbus-ptest-ptest-***.rpm), 
but not install it. How to resolve it?

Best Regards
Chong

