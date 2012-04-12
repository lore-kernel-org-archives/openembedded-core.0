Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1SIEOO-0005Ie-Gp
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 09:24:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3C7FBcZ023412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 00:15:11 -0700 (PDT)
Received: from [128.224.171.127] (128.224.171.127) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Apr 2012 00:15:11 -0700
Message-ID: <4F8680FD.1030606@windriver.com>
Date: Thu, 12 Apr 2012 10:15:09 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1334160473-7046-1-git-send-email-florin.sarbu@windriver.com>
	<109F6B28-8525-47CE-A367-B5279375B639@dominion.thruhere.net>
In-Reply-To: <109F6B28-8525-47CE-A367-B5279375B639@dominion.thruhere.net>
X-Originating-IP: [128.224.171.127]
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
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
X-List-Received-Date: Thu, 12 Apr 2012 07:24:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Yeah, I kinda figured that one out last night when going through the 
deps again. meta-oe systemd had a dependency on vala.bbclass which in 
turn dragged in vala native. Eliminating the unnecessary vala bbclass 
usage, vala native is not needed anymore.
Hence the confusion.
Excuse the trouble caused


On 04/12/2012 09:28 AM, Koen Kooi wrote:
>
> Op 11 apr. 2012 om 18:07 heeft Florin Sarbu<florin.sarbu@windriver.com>  het volgende geschreven:
>
>> Added the vala package from meta-oe to support future systemd integration.
> But systemd doesn't need vala......
>
>
>> Signed-off-by: Florin Sarbu<florin.sarbu@windriver.com>
>> ---
>> meta/recipes-devtools/vala/vala.inc       |   25 +++++++++++++++++++++++++
>> meta/recipes-devtools/vala/vala_0.12.1.bb |    7 +++++++
>> 2 files changed, 32 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-devtools/vala/vala.inc
>> create mode 100644 meta/recipes-devtools/vala/vala_0.12.1.bb
>>
>> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
>> new file mode 100644
>> index 0000000..0815c66
>> --- /dev/null
>> +++ b/meta/recipes-devtools/vala/vala.inc
>> @@ -0,0 +1,25 @@
>> +DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
>> +Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
>> +SECTION = "devel"
>> +DEPENDS = "glib-2.0 dbus"
>> +BBCLASSEXTEND = "native"
>> +DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
>> +HOMEPAGE = "http://vala-project.org"
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>> +INC_PR = "r0"
>> +
>> +#
>> +# WARNING: This source release has specifically been built for OpenEmbedded.
>> +# Don't update to any upstream release without consulting the recipe maintainer.
>> +#
>> +
>> +SRC_URI = "\
>> +  http://downloads.freesmartphone.org/sources/vala-${PV}.tar.bz2;name=archive \
>> +"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF = "--disable-vapigen"
>> +
>> +FILES_${PN}-doc += "${datadir}/devhelp"
>> diff --git a/meta/recipes-devtools/vala/vala_0.12.1.bb b/meta/recipes-devtools/vala/vala_0.12.1.bb
>> new file mode 100644
>> index 0000000..1049ed6
>> --- /dev/null
>> +++ b/meta/recipes-devtools/vala/vala_0.12.1.bb
>> @@ -0,0 +1,7 @@
>> +require vala.inc
>> +SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.tar.bz2"
>> +
>> +FILES_${PN} += "${datadir}/vala-0.12/vapi"
>> +
>> +SRC_URI[md5sum] = "bf35262cc611de447147d01cbac33767"
>> +SRC_URI[sha256sum] = "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32bef6a0051f58ea8"
>> -- 
>> 1.7.9.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



