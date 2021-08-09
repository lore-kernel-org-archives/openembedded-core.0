Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web08.21914.1628511598252580176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 05:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=LXfheim4;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id D4G0mA1UkOQhvD4G1mUZJ8; Mon, 09 Aug 2021 13:19:53 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IvmFjI3g c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=iGHA9ds3AAAA:8 a=9oy6nQPC2m_EyUMm0BYA:9
 a=CjuIK1q_8ugA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=I7vDGbO2GmjXC+/wt/KoFl+z5mHno/tOrnn7fbQmwOI=; b=LX
	fheim4OdSuQbtpCc1BugzaGRK52sjid28VDGJrOvYpqAVZ0vAn14HuJzYsNsUTzqq+74PATSULV63
	YRRhX+ublj1aodE/CPQRdmeYH6QdjnCxhoZbcsa5HYh8bzvljLjZslT0B3MPhUvwfVOh/lZ9oydfc
	qRZhyPojCEiOQGZZ80qPhRduAzSWrgF6KBOFrf9F1dhsk+6Wjpv6l7Kle3AR02dg5B4Vq9rckilkJ
	mPuVyLwIl6uCSoXeMVOQR6jw5ET/bKXWZrjdIMlbg0nSsmFXduwgjpQ3ZNcBeYrmM2Hd9XYIoGhJ4
	RlnWPgsKDxmyguTjVzhN/nnL5AMBD6KA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mD4G0-00019E-0B
	for openembedded-core@lists.openembedded.org; Mon, 09 Aug 2021 13:19:52 +0100
Date: Mon, 9 Aug 2021 13:19:51 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: pseudo: Outdated records for newly-ignored paths in database cause mismatches
Message-ID: <20210809121951.GA480@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfAqJqLzFHh/8kgm/ZiJWOlALYrXtE+w1+f/uKHwFAqGQ8nVtZLz3fkJpNzt18awbvxzuf9wBVWD3F+4KCFPNOhDC0uxt9YzpKFg7u0aIOFPDQhtkmEVB
 fsc9o8IxGQcPDHSYqBx+QyQlmDnXMUfCnaKyWSsPIUriJzgTuI3fP7UAoH1JaNIMDChemzPZ16O1GQ==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Our CI Dunfell builds started failing during image creation with pseudo
aborts like:

path mismatch [2 links]: ino 123107550 db '/.../build/tmp-glibc/work/mymachine-oe-linux/myimage/1.0-r2/oe-rootfs-repo/mymachine/mypackage-dbg_1.0-r7_mymachine.ipk' req '/.../build/mymachine-root/usr/bin'.

Inode 123107550 is the second of the two paths.

We're using the latest pseudo (b988b0a6b8afd8d459bc9a2528e834f63a3d59b2)
because we ran into problems sharing sstate cache between different build
OS versions prior to oe-core:d7e87a5851d717da047f552be394d5712efa0402.

The mismatches started happening just after we took
oe-core:9463be2292b942a1072eea88881b9644e55aadb9 (as
b04d7a7aed5b05e8561029c5e570206ac9b9fa4e for Dunfell):

index 459d872b4a..244f5bb8ff 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -180,6 +180,8 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"

+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo"
+

I was able to reproduce a similar problem by commenting out the above
PSEUDO_IGNORE_PATHS line, building and image, putting it back and forcing
do_rootfs for the image to run again without any intervening cleaning. It
didn't happen every time though.

I believe that the pseudo database was populated with many paths in
oe-rootfs-repo before this change. After the change, the files in
oe-rootfs-repo were replaced which freed up their inodes, but because the
paths were ignored the database wasn't updated. Those inodes were
then used for files and directories in during rootfs creation. Pseudo
incorrectly believed that these inodes were already associated with files
it knew about based on the out-of-date database records.

Cleaning the work directory makes the problem go away because that deletes
the pseudo databases.

Does the above make sense as an explanation for these errors? If so, is
there a good way to avoid these errors?

Could pseudo check whether mismatched paths are now ignored and if so not
treat the mismatch as fatal?

Should changing PSEUDO_IGNORE_PATHS cause all tasks for the recipe to be
re-run so that the out-of-date database is removed?

Even if it's not worth employing some technical measure, perhaps this is
worth mentioning as a potential false alarm at
https://wiki.yoctoproject.org/wiki/Pseudo_Abort ?

Thanks.

Mike.
