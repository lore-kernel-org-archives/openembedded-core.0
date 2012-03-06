Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4tMv-0004ND-EB
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 13:19:53 +0100
Received: by wera1 with SMTP id a1so3151363wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 04:11:18 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.135.169 as permitted sender)
	client-ip=10.216.135.169; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.135.169 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.135.169])
	by 10.216.135.169 with SMTP id u41mr8170518wei.13.1331035878035
	(num_hops = 1); Tue, 06 Mar 2012 04:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=khwNt0J+Vk/E+7FiD/AegolyBBFwRUNVbpjWOBmGeSU=;
	b=S8VYi78W4qw3IndbBxuH6XkQ8qk52vslCkNM+1K6+wlMW3qFrX7XHu3rSJzcWFo0vQ
	4C06uUYjqMERWN71cjxN344EuEZTi2154WXm6syCLRUywYd9Qx5nI1NjPovlRdpn6Z1x
	cDSS3V6Vm4YkKTCowa4+NlXy/QinBVUBQyj5uEoEDEbklouhDSjZLW/BLjO/9VBhiBjN
	Zs2XadtqpsD6BJj0hrSL79/T7CHfjOnj8Ij3qMjqTx7y6JkLqo2futm7evxtRinRJM93
	fCgeUBWvW+YjDA/agi32Q9JGoxMVB2sW9sKzInMWLeX6skAxc0KofAHYQCecdC+bqYA+
	fVrg==
Received: by 10.216.135.169 with SMTP id u41mr6511348wei.13.1331035877933;
	Tue, 06 Mar 2012 04:11:17 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fw5sm27766445wib.0.2012.03.06.04.11.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 04:11:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 6 Mar 2012 13:11:15 +0100
Message-Id: <DDCC2C87-F44F-4AA0-8854-E7376CF3AC72@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkUu9NkvUSfakk0bhFdwK118u7GSvv3xNDNpVL3uvOx1OXAcJlgm6z5SJKN5xfcn/o89RDZ
Subject: [RFC] updating xz to 5.1.1alpha or git master
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
X-List-Received-Date: Tue, 06 Mar 2012 12:19:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Latetely I've been trying to optimize the time it takes to rebuild the =
beaglebone factory image, which is delivered as a 4GiB SD card image =
people can dd to their SD cards. I tried and failed to replace genext2fs =
with mkfs.ext4 since uboot can only read from a ext2 -> tune2fs -> ext4 =
partition, not from a mkfs.ext4'ed partition. So the next step was to =
tackle the compression step.=20

All tests done on a intel i7 with 16GiB  RAM

Regular xz:

$ time xz -k -e 4gb.img

real	7m26.158s
user	6m38.345s
sys	0m2.076s

$ du -hs *xz
143M 4gb.img.xz

With https://github.com/vasi/pixz:

$ time pixz -t 4gb.img 4gb.img.xz
real	2m9.997s
user	9m41.085s
sys	0m6.990s

$ du -hs *xz
151M 4gb.img.xz

After posting those stats on G+ Brian Marete pointed me to the alpha =
releases of xz that have pthread support:

With xz git master and -T8:
real	1m43.144s
user	10m29.579s
sys	0m5.456s

Based on that I'd like to update xz(-native) to the alpha release, but =
I'm not familiar enough with the xz project to say if that's a good idea =
or not. So, any comments from xz users?

regards,

koen



