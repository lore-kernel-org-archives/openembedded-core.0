Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SMbkO-0005w6-PT
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:09:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3O8xjt0013039
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 01:59:45 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 24 Apr 2012 01:59:44 -0700
Message-ID: <4F966B7B.8060205@windriver.com>
Date: Tue, 24 Apr 2012 16:59:39 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
	<7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net>
	<4F964456.6050106@windriver.com>
	<71A92016-D7C8-4834-8E80-849F267B3B8C@dominion.thruhere.net>
	<1335252545.12692.103.camel@ted>
In-Reply-To: <1335252545.12692.103.camel@ted>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q3O8xjt0013039
Subject: Re: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Tue, 24 Apr 2012 09:09:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B404=E6=9C=8824=E6=97=A5 15:29, Richard Purdie wrote:
> On Tue, 2012-04-24 at 08:29 +0200, Koen Kooi wrote:
>> Op 24 apr. 2012, om 08:12 heeft Xiaofeng Yan het volgende geschreven:
>>
>>> On 2012=E5=B9=B404=E6=9C=8824=E6=97=A5 13:53, Koen Kooi wrote:
>>>> Op 24 apr. 2012, om 07:50 heeft Xiaofeng Yan het volgende geschreven=
:
>>>>
>>>>
>>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>>
>>>>>
>>>>> LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
>>>>> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
>>>>> For passing lsb test I add PACKAGECONFIG support to the recipe and =
\
>>>>> have poky-lsb turn on the poky-lsb distro for this recipe.
>>>>>
>>>>> [YOCTO #2284]
>>>>>
>>>> Shouldn't this be an 'x11' DISTRO_FEATURE instead?
>>>>
>>> because "--without-x11" is disabled when x11 exists in core-image-sat=
o. Using 'x11' DISTRO_FEATURE instead will change the default set, which =
will cause enable "--with-x11" when x11 is in DISTRO_FEATURE. LSB Test Su=
ite need this configuration but other image may not need it even if havin=
g x11.
>> What use-case is there for having 'x11' in DISTRO_FEATURES but not wan=
ting x11 support in pixbuf?
>>
>> Regardless of that, poky-lsb distro overrides have no place in oe-core=
, they should go into their own layer as bbappends.
> We should be using the linuxstdbase override and also make it
> conditional on x11 being in DISTRO_FEATURES.
You mean I should use the following methods in gdk-pixbuf_2.24.1.bb
EXTRA_OECONF_append_linuxstdbase =3D " ${@base_contains('DISTRO_FEATURES'=
,=20
'x11', '--with-x11', '--without-x11', d)}"

The above variable should be putted into gdk-pixbuf_2.24.1.bb because=20
poky-lsb.conf is parsed before this bb file.
right ??
> As far as I can tell nothing uses/cares about this library apart from
> lsb right now. If that changes I'm happy to build more of the time but
> until we need it, its pointless. We should also split it into a separat=
e
> package.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



