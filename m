Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 444EA77A2D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 13:54:46 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id x124so28634842wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 06:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=4Jzxba6cQUAzEY9Gm4NGmyra5LouJkxckALmvymbxiQ=;
	b=H2oKxF1hthSPhL5IaUMpsBn+jIutH7RRERruyS3Ypx+9I7YpAyRFMVZcThW2xPicg/
	M0o4qCYMv8f+iV7DQ6sNXGJP37FRUIHLzo6ialn2aWxfB9SFOt1n70JVgT+ClnBZgw0m
	0NtWabcNYSvnY9JUQcdwoPg1eq2anFN8beA9zXNziSnHCNESp+5PiH26o+I6JnJgb4eM
	AzxpMkJgd/87p7O91KoCJcO4aZ7kVws68xkXvzqAv19iGcrXaN9HrkDKEGSWRENq8cza
	3MZipeUhMcF3xyfinTwPFT/B2s1RJLxNvjfxtTRe15xjuKF4rUawaAvRKoAX9cY3+uWk
	x4PQ==
X-Gm-Message-State: AFeK/H1k/buXz00UMZBCOMvZnkq5dri+2/+H1VXS+XVjXXPf2xBadWRQIRUrvTCt+SPYmg==
X-Received: by 10.28.54.66 with SMTP id d63mr14772728wma.103.1491314087572;
	Tue, 04 Apr 2017 06:54:47 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k128sm18552211wmf.16.2017.04.04.06.54.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Apr 2017 06:54:46 -0700 (PDT)
Message-ID: <1491314085.15389.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 04 Apr 2017 14:54:45 +0100
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: tainting other recipe's specific task
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
X-List-Received-Date: Tue, 04 Apr 2017 13:54:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Is it possible to invalidate one recipe's hash for a specific task from
another recipe?

More specifically, I have an initramfs image recipe and a main image recipe
where do_rootfs of the main image [depends] on do_deploy of initramfs.

If do_rootfs of the main image needs to be re-run, I need to make sure that
do_rootfs of the initramfs image is re-run (and of course do_deploy) before.
Basically I want to add a timestamp to both images, and the timestamp should
be the same.

Using my current dependencies, do_rootfs of the main image is re-run if the
initramfs is re-deployed:

--- snip main_image.bb: ---
do_rootfs[depends] += "initramfs:do_deploy"
--- snap ---

but I need this both ways. Just adding the equivalent to the initramfs
recipe results in bitbake complaining about a recursive dependency loop.


Can this be achieved? Even some pointers would be helpful...


Or some other approach where I can add the same timestamp to both images if
either of the images needed to be rebuilt due to some change?


Cheers,
Andre'


