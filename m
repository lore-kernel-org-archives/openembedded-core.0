Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sctw7-00087E-5c
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 09:48:47 +0200
Received: by eekd49 with SMTP id d49so866355eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 00:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=qvvQGv9W7bsJc8hwEOqmptvWS9ADQFtQ3/pAEWplJi4=;
	b=djQaiatfs2DjXlbmqHBRjE4sZW8FZROBjVqdxOIH3V2b40JrHoCYu4t3Tw9BfxvDqL
	raYXxwpAZZmAKGbATpT3FfQcEKD0FgQj35eAYEm5GqheHk3AhG1+FzMQrE1yu2rzIDfe
	R8pCI59hNPiQYymTvLKp9OzJFOQ8rzI9XQi7NCdq05NvnLr3E+XaNkil5A+7g/OYvntB
	OM7Jsdw527JHSvRpjp3XCf+xXrwGFp5ovisiLj7TVG37bvd/yqxlzPHyvIajnyZhjt6v
	No0o0aE6c3cBM1M+A9+FoPTBzluRQbG0QABY1ViWzKBnQ9Q2vdew1jY8Cd0Jx7LdNhdx
	qx8w==
Received: by 10.14.100.194 with SMTP id z42mr3576439eef.146.1339141097577;
	Fri, 08 Jun 2012 00:38:17 -0700 (PDT)
Received: from ?IPv6:2001:610:612::f827:ca0e:9376:ca98?
	([2001:610:612:0:f827:ca0e:9376:ca98])
	by mx.google.com with ESMTPS id t3sm19033823eeb.15.2012.06.08.00.38.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 00:38:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FD198CB.6080707@linux.intel.com>
Date: Fri, 8 Jun 2012 09:38:11 +0200
Message-Id: <5538CD72-DF96-47EE-BC0A-EE0890D6FB7A@dominion.thruhere.net>
References: <4FCE71F6.3060001@linux.intel.com> <4FCF8999.4000405@windriver.com>
	<074C2787-310B-4A3D-84AC-EB2E59D48FF3@dominion.thruhere.net>
	<4FD198CB.6080707@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnqWWeDqVchWyaMJRydrbh6dMzxK3dXpE1Hlr0guyI14i+qGcnNnwB5OUD6Zs+BeUZ7Iljp
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Braindump on Bootloaders, Image Types, and Installers
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
X-List-Received-Date: Fri, 08 Jun 2012 07:48:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 8 jun. 2012, om 08:16 heeft Saul Wold het volgende geschreven:

> On 06/07/2012 09:11 AM, Koen Kooi wrote:
>>=20
>> Op 6 jun. 2012, om 18:47 heeft Mark Hatle het volgende geschreven:
>>=20
>>> I don't have specific comments below, but I can share some of what I =
will be working on for my company in the next 6 months or so.
>>>=20
>>> I will be working on moving the image generation: filesystem =
construction, filesystem ->  image generation, and similar into a =
framework that can reside externally of OE-core/bitbake.
>>>=20
>>> The idea is that we should have a single framework that can =
construct the filesystem from the package feeds, construct the images =
(using the parameters and more that you list below), and then eventually =
deploy these images onto the target system.
>>>=20
>>> Having this external of oe-core will allow it to be invoked by =
OE-core, as it is today, as well as for on-target installers, people who =
want to start w/ the package feeds, etc.
>>=20
>> Chris Larson mentioned this idea during lunch at the last ELC. For =
angstrom we already put heavy emphasis on the narcissus tool for users =
to generate their images and lately I have been needing root permissions =
for various ext4 tweaks which oe-core/bitbake can't do (and really =
shouldn't).
>>=20
> Hmm, more info here, please.
>=20
> I am looking at moving OE-Core to use ext4 by default, is there =
something that will break if we do that?  It seems like it's the right =
time to do that based on where maintenance and support of ext3 and ext4 =
are.

tl;dr version: a real ext4 partition requires mkfs.ext4, genext2fs + =
tune2fs + fsck is flaky and won't give you the actual ext4 benefits.


Some background: my ext4 quest was started to make the system feel =
faster when using cheap kingston sd cards. I started out with thinking =
"ext4 is just ext2 with some extra bits", so I did the genext2fs + =
tune2fs thing:

case "${ROOTFSTYPE}" in
		ext3)
				genext2fs -z -N $FS_NUM_INODES -b =
$FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
				tune2fs -L ${IMAGE_NAME} -j =
${LOOPDEV_FS}
				;;
		ext4)
				genext2fs -z -N $FS_NUM_INODES -b =
$FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
				tune2fs -L ${IMAGE_NAME} -j -O =
extents,uninit_bg,dir_index ${LOOPDEV_FS}
				;;
		*)
				echo "Please set ROOTFSTYPE to something =
supported"
				exit 1
				;;
esac

The above plays nice with bitbake and pseudo and according to all the =
wikis yields an ext4 system. And as a bonus the u-boot ext2 parser can =
load a uImage from it. It has however a few downsides:

1) you need to run fsck.ext4 to init the dir_index
  1a) fsck.extX is stupid and will not always treat that ext4 system as =
an ext4 system. If you have an fsck .conf file in /etc/ you've already =
lost. I had it working on my build machine, but after an update to =
e2fsprogs it stopped working, it only ran in ext2 mode. Ironically, the =
only systems that will reliably treat that partition as ext4 are my OSX =
systems where I compiled and installed e2fsprogs myself.
2) the big ext4 feature 'extents' will only work on files created =
*after* that fsck.

So you end up with an ext3 system that needs an fsck to actually work =
and has none of the ext4 features out of the box.

What I have been doing to get around this is totally screwed up:

The initial creation of the SD card:

* generate the multipartition image with OE
* mkfs.ext4 the second partition, erasing what OE put there with =
genext2fs + tune2fs
* tar xjf the rootfs.tar.bz2 to the second partition
* dd image to sd card

And for all the updated images the past few weeks:

* opkg update ; opkg upgrade on the target
* rm /mnt/loop/home/root/.[A-z]* /mnt/loop/etc/dropbear/* -rf on the =
host
* dd /dev/sdX | pv -s 3484M > sd.img

The only advantage of this is that upgrade paths must work and I never =
run into changes-without-PR-bump problems because the angstrom uploader =
filters out duplicate filenames before uploading. But for the rest: =
completely screwed up.

regards,

Koen=


