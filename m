Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT8s4-00063U-Ld
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 10:12:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN95Ghl010194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Nov 2011 01:05:16 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 23 Nov 2011 01:05:16 -0800
Message-ID: <4ECCB70A.3020003@windriver.com>
Date: Wed, 23 Nov 2011 17:04:10 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1321528387.git.xiaofeng.yan@windriver.com>
	<ad4d06cb79983b6a1a06b5cdd83e565af031b05f.1321528387.git.xiaofeng.yan@windriver.com>
	<4ECBEED9.5070409@linux.intel.com>
In-Reply-To: <4ECBEED9.5070409@linux.intel.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pAN95Ghl010194
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk+: Have gtk+ pick up ${NM} from the environment
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
X-List-Received-Date: Wed, 23 Nov 2011 09:12:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B411=E6=9C=8823=E6=97=A5 02:50, Saul Wold wrote:
> On 11/17/2011 03:16 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> hen gtk+ configures, it should pick up ${NM} from the environment \
>> if it is defined, instead of just looking for "nm".
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> .../gtk+/gtk+-2.24.6/configure-nm.patch | 14 ++++++++++++++
>> meta/recipes-gnome/gtk+/gtk+_2.24.6.bb | 3 ++-
>> 2 files changed, 16 insertions(+), 1 deletions(-)
>> create mode 100644=20
>> meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch=20
>> b/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
>> new file mode 100644
>> index 0000000..5aeef50
>> --- /dev/null
>> +++ b/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
>> @@ -0,0 +1,14 @@
>> +Upstream-Status: Inappropriate [configuration]
> I am not sure I would agree here, I think that the upstream might be=20
> interested in having a cross-compilation fix.
>
> Sau!
>
Hi Saul,

Thanks for your comment.

gtk use "/usr/bin/nm" at current status by testing. if using=20
"AC_CHECK_TOOLS(NM, [$NM nm], nm) ", it will use "xxx-nm" under sysroot.=20
So I think this patch can avoid this problem.
If you think it is not necessary for OE-core, I will submit this patch=20
to upstream if possible.

Thanks
Yan
>> +Signed-Off-By: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> +# Pick up ${NM} from the environment
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -190,7 +190,7 @@
>> + AC_SYS_LARGEFILE
>> +
>> + AM_PROG_AS
>> +-AC_PATH_PROG(NM, nm, nm)
>> ++AC_CHECK_TOOLS(NM, [$NM nm], nm)
>> +
>> + dnl Initialize maintainer mode
>> + AM_MAINTAINER_MODE
>> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb=20
>> b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
>> index cd5c8cb..ade0a2d 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
>> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f7e7 \
>> SRC_URI =3D=20
>> "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>> file://xsettings.patch \
>> file://run-iconcache.patch \
>> + file://configure-nm.patch \
>> file://hardcoded_libtool.patch \
>> file://no-demos.patch \
>> file://cellrenderer-cairo.patch;striplevel=3D0 \
>> @@ -26,7 +27,7 @@ SRC_URI =3D=20
>> "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>> # file://combo-arrow-size.patch;striplevel=3D0
>> # file://configurefix.patch
>>
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> SRC_URI[md5sum] =3D "421100f6597e613234f8dead6091a9fe"
>> SRC_URI[sha256sum] =3D=20
>> "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
>



