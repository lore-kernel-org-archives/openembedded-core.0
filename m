Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1D09B6010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 13:39:26 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id r15-v6so3255395uao.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GV3QQYMVxwWONQXCdb9hW52iyVATUcVTfnUFWSgakRk=;
	b=K0blluD4p4jqE9u20tQBEpLmvFivaHatoQxC7XT1hDsVrjPxqNieDjOjrkU0FaGbzP
	HgDpldknY0KOpGz5tgaHmiHFJ85mTocRS0TrCx3unvX7UO4w7fD334pB8qWY+q5RWCm7
	ceIL7Sl6n3iVLtKIsCtFefx5hm+uousWKMmxXUqWusp1NaAOaE6VtHjrFcuwz8AoUFBa
	p++sctXVO15G0q7KjaRO78aTTbeco0AqngHcuQdjvUIPqK4oqCt8GIOEESWX5IJBV7J7
	UHlcSoW20pXCzhfPla7rMLS+vzu9OHeFUDOEYvIcef3NwEKJ8qR0H+cVObteUHm+YBj/
	rIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GV3QQYMVxwWONQXCdb9hW52iyVATUcVTfnUFWSgakRk=;
	b=E4CN6x/WWQbEjcwCQq5jWB1+Uhb1Cd4iGYFjujs2xG/ipYE5WC6dpUtb0cfQVUnuaz
	FXWQysfq5nkIBM2fOYXVLT25VDm33V9SDeB6ySBc+17CZg+vbp4NCmnm5D0ZWdq/Y1lk
	PFyKpyV5pU4KU5cZePw/kQoC8ETJAoCD3gBoZ6IaedWuvJEZj0WZmz8YA5sk/D7AGTXe
	2rKVUhG2reFgfJGBnjP2AeFjaO7gVAA5TL+kRIPvFeZ5mM3OILgWg8rpFBg3SvSgv58F
	NNAk2tUIeANrEpxSBvdsuY7jdGhA0DoogPeZHAI5uRpw93RhcIkU85AfvFYF0LJqZLcM
	VYHA==
X-Gm-Message-State: APzg51Bbl8i7Firf6Bbzaib44FklgUDBsQDEWErpotEkV3AQPVqjDYE+
	r70jBDyScs+dUOcvhdkLQ7blYkhQftPFzRCBlHY=
X-Google-Smtp-Source: ANB0VdZpU84+lF/BHZyMp7byABcWP9n8lR7V803VMiN5zlXiN1VULOZgOvvaHTGXCA/Tf43A6LdnXfK66PLyhLUNYOc=
X-Received: by 2002:a9f:33ee:: with SMTP id
	y46-v6mr4120122uab.90.1535549967688; 
	Wed, 29 Aug 2018 06:39:27 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 29 Aug 2018 14:39:16 +0100
Message-ID: <CAO5Uq5Q2QLz-TM-0Nugzj15Qzpdj1xFaLptGR_KJL6qtWQi7wg@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>,
	openembedded-core@lists.openembedded.org
Subject: Multiconfig builds broken in master
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
X-List-Received-Date: Wed, 29 Aug 2018 13:39:27 -0000
Content-Type: text/plain; charset="UTF-8"

I've run into a weird multiconfig problem on master which seems to
have been introduced with

b8730f6 ("bitbake: bitbake: Add support for multiconfig dependencies")

Before that, I could happily use:

bitbake multiconfig:gplv2:production-image

whereas now it fails (gplv2 is a multiconfig which basically just sets
TMPDIR and INCOMPATIBLE_LICENSES).

The error suggests failure to populate IMAGE_FEATURES correctly:

ERROR: Nothing PROVIDES 'production-image'
production-image was skipped: 'ostree' in IMAGE_FEATURES is not a
valid image feature. Valid features: allow-empty-password
allow-root-login autologin dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs
eclipse-debug empty-root-password hwcodecs muted nfs-client nfs-server
package-management post-install-logging ptest-pkgs read-only-rootfs
splash ssh-server-dropbear ssh-server-openssh staticdev-pkgs
tools-debug tools-profile tools-sdk tools-testapps usb-nmc x11
x11-base x11-sato

(the ostree feature is introduced by a layer derived from the Intel
IoT refkit - https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/classes/ostree-image.bbclass)

If I revert that single commit everything works again.

Clearly there's nothing in that changeset which is touching
IMAGE_FEATURES, so it's something way more subtle!

-- 
Alex Kiernan

