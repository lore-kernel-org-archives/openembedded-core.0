Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFFA7953E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 07:11:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w867B0a3001545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 00:11:00 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 6 Sep 2018 00:10:59 -0700
To: Steffen Sledz <sledz@dresearch-fe.de>,
	<richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
References: <94e49755-3c5a-a4fe-47da-b5881a2d7c43@dresearch-fe.de>
	<3d2233af61b189875478bfe65fefb96b0c2c97c5.camel@linuxfoundation.org>
	<12694af3-0513-71a2-42cb-025d47aac87a@dresearch-fe.de>
	<dc04038009f70f6b8757c12099c4c7bc20547760.camel@linuxfoundation.org>
	<df95f7d0-3fed-cf8e-1072-4fa66a514282@dresearch-fe.de>
	<60eaf356-4cb1-fac0-e9bf-e2fdfad74a12@dresearch-fe.de>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <559d8209-56b1-2d30-8f4a-434173c99bb0@windriver.com>
Date: Thu, 6 Sep 2018 15:15:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <60eaf356-4cb1-fac0-e9bf-e2fdfad74a12@dresearch-fe.de>
X-Originating-IP: [128.224.162.218]
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: =?UTF-8?B?UmU6IERlcGVuZGVuY3kgbG9vcHMgd2hlbiBlbmFibGluZyBwdGVzdCB3aXRoIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Thu, 06 Sep 2018 07:11:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2018 02:52 PM, Steffen Sledz wrote:
> After some hours of analysis I could identify the following commit in meta-angstrom introducing the loops.
>
> -------------------> snip <----------------------
> commit c94ca0759c34e637b725f648a1925e007bbe60e9 (HEAD -> work, m/angstrom-v2017.12-rocko, github/angstrom-v2017.12-rocko)
> Author: Koen Kooi <koen.kooi@linaro.org>
> Date:   Sat Jul 7 09:23:11 2018 +0200
>
>      systemd bbappend: enable importd
>
>      Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> -------------------> snap <----------------------
>
> This one adds
>
>    DEPENDS += "glib-2.0"
>
> to recipes-core/systemd/systemd_%.bbappend. :(
>
> However, I am not sufficiently involved in the subject matter to propose a solution.
>
> Koen?
>
Hi Steffen,

I tried to find your repo but failed. The meta-angstrom layer in 
meta-opembedded's layer index does not have this commit.

Anyway, I checked the current codes of systemd. glib is only used for tests.
$ grep -r HAVE_GLIB src/
src/libsystemd/sd-bus/test-bus-marshal.c:#if HAVE_GLIB
src/libsystemd/sd-bus/test-bus-marshal.c:#if HAVE_GLIB
src/libsystemd/sd-bus/test-bus-gvariant.c:#if HAVE_GLIB
src/libsystemd/sd-bus/test-bus-gvariant.c:#if HAVE_GLIB
src/libsystemd/sd-bus/test-bus-gvariant.c:#if HAVE_GLIB

Also, the meson_options.txt states:
option('glib', type : 'combo', choices : ['auto', 'true', 'false'],
        description : 'libglib support (for tests only)')

So I guess you can just remove such dependency.

Best Regards,
Chen Qi

