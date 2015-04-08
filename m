Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09D08737EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 09:32:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t389Wem1005752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Apr 2015 02:32:40 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Apr 2015 02:32:39 -0700
Message-ID: <5524F5B6.4000407@windriver.com>
Date: Wed, 8 Apr 2015 17:32:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>	<7c8475e9f21581916595d0ef7d587ce3ec1614a9.1428405830.git.liezhi.yang@windriver.com>	<1428442765.14020.482.camel@linuxfoundation.org>	<55249123.6090008@windriver.com>	<CAHiDW_FjO_0BP9+AoQDbS=Y268oUs1TXBhNh2_Vti_yhdMap-A@mail.gmail.com>
	<5524EF4B.8040405@windriver.com>
In-Reply-To: <5524EF4B.8040405@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/10] glib-2.0: 2.42.1 -> 2.44.0
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
X-List-Received-Date: Wed, 08 Apr 2015 09:32:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I've updated the patch in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/PU


     glib-2.0: 2.42.1 -> 2.44.0

     Backported a patch to fix build on CentOS' gcc 4.4.7:
     0001-GListModel-roll-back-use-of-type-redefinition.patch

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git 
a/meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinition.patch 
b/meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinit
new file mode 100644
index 0000000..7d95743
--- /dev/null
+++ 
b/meta/recipes-core/glib-2.0/glib-2.0/0001-GListModel-roll-back-use-of-type-redefinition.patch
@@ -0,0 +1,42 @@
+From 4a292721bcf2943bfc05c6a1c859992f28e3efec Mon Sep 17 00:00:00 2001
+From: Ryan Lortie <desrt@desrt.ca>
+Date: Wed, 25 Mar 2015 09:29:49 -0400
+Subject: [PATCH] GListModel: roll back use of type redefinition
+
+We declare the typedefs for GListModel and GListStore in giotypes.h, as
+a matter of convention.  This is not actually required, since the
+typedef is emitted as part of the G_DECLARE_* macros.
+
+The giotypes.h approach is only used to avoid cyclic dependencies
+between headers, which is not a problem in this case.
+
+Type redefinition is a C11 feature, and although it was around in some
+compilers before then, gcc 4.2.1 (from 2007) is apparently still in wide
+use, being the default compiler for OpenBSD.
+
+Eventually, we will probably hit a case where we actually need to
+redefine a type, but since we're not there yet, let's back off a bit.
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

// RObert

On 04/08/2015 05:05 PM, Robert Yang wrote:
>
>
> On 04/08/2015 03:42 PM, Jussi Kukkonen wrote:
>> On 8 April 2015 at 05:23, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> On 04/08/2015 05:39 AM, Richard Purdie wrote:
>>>> This blew up badly on the autobuilder:
>>>>
>>>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=c8da6d7390ad626c03d5b9b431a97adeaeb60a89
>>>>
>>>
>>> Sorry, the failures are on CentOS 6.6, please ignore this upgrade atm, I
>>> will
>>> find a CentOS 6.x to fix the problem.
>>
>> That's typedef redefinition (C11 feature and supported by gcc for
>> quite a while). Why does CentOS specifically choke on that?
>>
>> Anyway, upstream has decided to roll this back: apparently some gcc
>> versions that are still in use do not support the feature.
>> GLib commit 4a292721bc should help.
>
> Thank you very much, I will backport it to fix the problem.
>
> // Robert
>
>>
>> Jussi
>>
>>

