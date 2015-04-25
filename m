Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3752D6AC24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Apr 2015 10:14:19 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Ylx6K-0002cD-Dp from Dmitry_Eremin@mentor.com ;
	Sat, 25 Apr 2015 03:14:20 -0700
Received: from [137.202.140.150] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Sat, 25 Apr 2015 11:14:18 +0100
Message-ID: <553B68F8.6000702@mentor.com>
Date: Sat, 25 Apr 2015 13:14:16 +0300
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1429905741-24667-1-git-send-email-dmitry_eremin@mentor.com>
	<20150424212013.GF2353@jama>
In-Reply-To: <20150424212013.GF2353@jama>
X-Originating-IP: [137.202.0.76]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4-x11-free: make virtual/libgl dependecy conditional
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
X-List-Received-Date: Sat, 25 Apr 2015 10:14:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2015 12:20 AM, Martin Jansa wrote:
> On Fri, Apr 24, 2015 at 11:02:21PM +0300, Dmitry Eremin-Solenikov wrote:
>> Make qt4-x11-free depend on virtual/libgl only if the DISTRO_FEATURES
>> contain opengl. Otherwise there will be no package to fullfil this
>> dependency.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
>> ---
>>   meta/recipes-qt/qt4/qt4-x11-free.inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
>> index 3b1e0fe..835fc96 100644
>> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
>> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
>> @@ -4,7 +4,8 @@ SUMMARY = "Cross-platform UI toolkit and application framework (X11 version)"
>>   DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
>>   HOMEPAGE = "http://qt-project.org/"
>>   SECTION = "x11/libs"
>> -DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
>> +DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
>> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
>
> That still leaves opengl support to be autodetected from sysroot for
> distributions without opengl in DISTRO_FEATURES but where someone built
> virtual/libgl provider before qt4-x11-free.
>
> You need to use PACKAGECONFIG to explicitly disable it when it should be
> disabled based on DISTRO_FEATURES.

I have checked the qt4-x11-free.inc file. It correctly sets QT_GLFLAGS 
depending on the presence of 'opengl' in DISTRO_FEATURES. So my patch is 
correct.


-- 
With best wishes
Dmitry

