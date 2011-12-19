Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RcUhA-0005dB-KP
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 05:19:25 +0100
Received: by vbbfc21 with SMTP id fc21so3823080vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 20:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=HvixRKpELfVWabsGvGVbIp7Vh2U8y98JV/fnJfeWEP8=;
	b=loDzR/5V3m+eZEBtMCDIF/jbsf3ZNoCsBH5fSwmtnxwVs9d6+WpXP/XXAxf6g0i4jE
	NgjQhanskFF2kQjmFAw8pxZs5P8VbGxZlhVxgMwtrXayjI339aPqp1iU/UK1LJov8zAV
	jklPpI0iPK3kiGz+onQN+OPLPwzD27feqSP8s=
MIME-Version: 1.0
Received: by 10.52.28.211 with SMTP id d19mr10450601vdh.48.1324267941610; Sun,
	18 Dec 2011 20:12:21 -0800 (PST)
Received: by 10.52.89.99 with HTTP; Sun, 18 Dec 2011 20:12:21 -0800 (PST)
In-Reply-To: <CAMKF1sru2cSoejrGD6OEDxvYeoD7XzrrkzhApZJqWWjukjL6fA@mail.gmail.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
	<94eb40ea45e45387d28fc04e3929f1044188b589.1323333676.git.sgw@linux.intel.com>
	<CAMKF1sru2cSoejrGD6OEDxvYeoD7XzrrkzhApZJqWWjukjL6fA@mail.gmail.com>
Date: Sun, 18 Dec 2011 20:12:21 -0800
Message-ID: <CAGDS+nmVUgF6sEdqH519gRbLAJwA2-RvbZB5X8kGXBcGB=kNUQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 15/17] wget: enable https and openssl
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
X-List-Received-Date: Mon, 19 Dec 2011 04:19:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 12:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Dec 8, 2011 at 12:44 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> =A0meta/recipes-extended/wget/wget.inc | =A0 =A06 +++---
>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended=
/wget/wget.inc
>> index 91400cc..7083569 100644
>> --- a/meta/recipes-extended/wget/wget.inc
>> +++ b/meta/recipes-extended/wget/wget.inc
>> @@ -2,13 +2,13 @@ DESCRIPTION =3D "A console URL download utility featur=
ing HTTP, FTP, and more."
>> =A0SECTION =3D "console/network"
>> =A0LICENSE =3D "GPL"
>> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
>> +DEPENDS =3D "openssl"
>>
>> -INC_PR =3D "r11"
>> +INC_PR =3D "r12"
>>
>> =A0inherit autotools gettext update-alternatives
>>
>> -# Disable checking for SSL since that searches the system paths
>> -EXTRA_OECONF =3D "--with-libc --enable-ipv6 --without-ssl"
>> +EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-ssl=3Dopenssl"
>
> this deserves to be a configurable thing IMO

Agreed.  Also, this seems to break the wget build for non x86 processors.

For example, on arm builds the config phase fails:

configure:30042: checking for libssl
configure:30072: ccache arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp
-mfpu=3Dneon -mtune=3Dcortex-a8
--sysroot=3D/media/Work/yocto-tmp/sysroots/omap3-multi -o conftest -O2
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu
-Wl,--as-needed conftest.c -ldl -lz  -lssl -lcrypto /usr/lib/libz.so
>&5
/usr/lib/libz.so: could not read symbols: File in wrong format

Steve


