Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QpO7n-0007IQ-Fu
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 19:23:55 +0200
Received: by iyf13 with SMTP id 13so5460604iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=CKb5j8Fb+eL0YBketARNRHb+8j6h5V1N9ozJMqAXh/8=;
	b=AfLlgWcxJ7w8HmNmy7BP9Jce+uUI83xhGeYrj7EPN1jtsDGVwc5gWg9fxdqPRWWnEB
	EqKsCbjLCJ+vssxBz8dGBhvyn7GlD0HuzzcRgr+J47hzZd7QDPzIwdhf/M826AxLAsHJ
	REMKm7pNlvQmq6CmQ7W9WAyX7ZfLe73WablIk=
Received: by 10.231.181.95 with SMTP id bx31mr1876032ibb.191.1312564770027;
	Fri, 05 Aug 2011 10:19:30 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q4sm2150393ibb.32.2011.08.05.10.19.27
	(version=SSLv3 cipher=OTHER); Fri, 05 Aug 2011 10:19:27 -0700 (PDT)
Message-ID: <4E3C261D.5020702@gmail.com>
Date: Fri, 05 Aug 2011 10:19:25 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <359B10B9B28B294BAA6405D9320312E0111E934067@naemmail08.na.leapfrog.com>
	<CABcZANkf_xBxAfs584Mo7370oLO8ggyy0BMQPfBy-dFN-qkWpA@mail.gmail.com>
In-Reply-To: <CABcZANkf_xBxAfs584Mo7370oLO8ggyy0BMQPfBy-dFN-qkWpA@mail.gmail.com>
X-Enigmail-Version: 1.2pre
Subject: Re: [PATCH] Immediately append TCLIBCAPPEND to TMPDIR in defaultsetup.conf
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
X-List-Received-Date: Fri, 05 Aug 2011 17:23:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/04/2011 09:59 PM, Chris Larson wrote:
> On Wed, Aug 3, 2011 at 2:54 PM, Daniel Lazzari
> <dlazzari@leapfrog.com> wrote:
>> Immediately append TCLIBCAPPEND to TMPDIR in defaultsetup.conf 
>> instead of lazily appending it with _append. This fixes a bug
>> where the wrong cache was cleared when BB_SRCREV_POLICY = "clear".
>> 
>> 
>> Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com> --- 
>> meta/conf/distro/defaultsetup.conf |    2 +- 1 files changed, 1
>> insertions(+), 1 deletions(-)
>> 
>> diff --git a/meta/conf/distro/defaultsetup.conf
>> b/meta/conf/distro/defaultsetup.conf index 072f03c..951e5be 100644 
>> --- a/meta/conf/distro/defaultsetup.conf +++
>> b/meta/conf/distro/defaultsetup.conf @@ -14,7 +14,7 @@ require
>> conf/distro/include/tclibc-${TCLIBC}.inc
>> 
>> # Allow single libc distros to disable this code TCLIBCAPPEND ?=
>> "-${TCLIBC}" -TMPDIR_append = "${TCLIBCAPPEND}" +TMPDIR :=
>> "${TMPDIR}${TCLIBCAPPEND}"
>> 
>> CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' +
>> str(bb.data.getVar('MACHINE', d,
>> 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' +
>> str(bb.data.getVar('SDKMACHINE', d,
>> 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
> 
> If all you want is an immediate concatenation, you can use .=. Using 
> := like this forces an early expansion of TMPDIR unnecessarily, as
> far as I can tell.

I think you mean TMPDIR .= "${TCLIBCAPPEND}" ?
I think that will work too. I have tested the original patch too and it
has worked ok but .= would be better I think let me try that as well.

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk48Jh0ACgkQuwUzVZGdMxT+FwCfcQ38C1x6DlSYtnLIlC0ov2aY
ZHYAn3SfzV483FUFCVdTZX67MJQQBZdw
=bUgM
-----END PGP SIGNATURE-----


