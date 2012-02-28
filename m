Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S2WoJ-0000vd-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 00:50:24 +0100
Received: by pbbrp12 with SMTP id rp12so4335994pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 15:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.194.8 as permitted sender) client-ip=10.68.194.8; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.194.8 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.194.8])
	by 10.68.194.8 with SMTP id hs8mr59812777pbc.113.1330472515279
	(num_hops = 1); Tue, 28 Feb 2012 15:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=STRTgo1KaV3vvJKkcPoyA65gB4QsaHyH/+xZQu1tOu8=;
	b=g5V9DVKwE1zqUIu5C9wAkaGtlnHFMRUZoM6iIozx7e8Wg+lW4wnu00PULrtdniZ5eN
	UKtHWLHnC+b3enb1Z5fnDWSWz4NEckhCJy/SoJUdZtADVfB8ERW/RlMT9bWTyU9PALx0
	Il8b/BNQKtSPfF+w/NFCJD6H9vwJWKVNdTmbk=
MIME-Version: 1.0
Received: by 10.68.194.8 with SMTP id hs8mr50380682pbc.113.1330472515078; Tue,
	28 Feb 2012 15:41:55 -0800 (PST)
Received: by 10.143.67.8 with HTTP; Tue, 28 Feb 2012 15:41:55 -0800 (PST)
In-Reply-To: <D1E600DA-4C86-4459-8820-F8B2AE88AAEF@dominion.thruhere.net>
References: <1330346629.4593.20.camel@ted>
	<D1E600DA-4C86-4459-8820-F8B2AE88AAEF@dominion.thruhere.net>
Date: Wed, 29 Feb 2012 00:41:55 +0100
Message-ID: <CAAQYJAvgS3gsZ8XCOcU89QgESvxsMsYYYfe_x-DF05m7ibeLwg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Refactor compression code into a generic compression solution
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
X-List-Received-Date: Tue, 28 Feb 2012 23:50:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 28, 2012 at 9:19 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 27 feb. 2012, om 13:43 heeft Richard Purdie het volgende geschreven:
>
>> The current approach of adding each different compressed image type doesn't
>> scale. This patch changes the code so compressed images for each form are
>> automatically available using the form <type>.<compression type> in
>> IMAGE_FSTYPES. This doesn't change any existing externally visible behaviour
>> and the image generation process becomes more efficient as a result too.
>
> There's a a few -f's missing in this patch, e.g. bz2 images now fail with:
>
> bzip2: ERROR: Function failed: do_rootfs (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-image-1.0-r0/temp/log.do_rootfs.3174 for further information)
> Output file Angstrom-systemd-image-eglibc-ipk-v2012.02-core-beagleboard.rootfs.tar.bz2 already exists.
>
> A quick look suggests at least bz2 and xz images can't get rebuilt.
>

Issues with cpio.lzma as well:

| ln: failed to create symbolic link
`/oe/oe-core/build/tmp-eglibc/deploy/images/initramfs-kexecboot-klibc-image-poodle.cpio.lzma':
File exists

Looking at run.do_rootfs I see runimagecmd is called twice.

In the log.do_rootfs there is also a strange

+ sed sERROR: Function failed: do_rootfs (see
/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/initramfs-kexecboot-klibc-image-1.0-r0/temp/log.do_rootfs.31195
for further information)
/generic_//g


Regards

Andrea
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


