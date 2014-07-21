Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 01BB865E47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:55:26 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id w7so5327448qcr.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 03:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vLUkTuEEfHyCEUbJ3ClhueBBhiDpUkmWlQLo5XNh11E=;
	b=FrrM1PtDww56+noWzv8xhUubzDwmahORwMLBs3XlOukLD4+zexXGs8ajXRK2RUTzXo
	awqIAemqAkzDV0A8AtKE0JV/1I8i3uIRwOpJ+joKytlHBKzFN2TA60V7IYFMGFVJkSum
	9iSMYpKnhFDXFujSYUkhjlXAzWVWfc/uUCzcY7lVL/S27nR21UtZFBkJciiISjvaX7mC
	ksh56OSpX1WwchdHmEfK/HiKga/saMQpzK8/NlHebslM/cJ7SVY9M2Au4BPUwNXmlTcS
	KwroSBUozCEtDY06R2D31o9PQCkBsIu3bwYNPiCUNAkJfSpfTKnREduIl7ZO/3VgDJdt
	94yw==
X-Gm-Message-State: ALoCoQnbgCIuTHYJBHSA8WYhohz9cKmar6WrUI+eZLOxYRHVUtFSC2N+7USk+SdSPaON2NrOq/Yl
X-Received: by 10.229.211.132 with SMTP id go4mr40254478qcb.0.1405940125919;
	Mon, 21 Jul 2014 03:55:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 21 Jul 2014 03:55:05 -0700 (PDT)
In-Reply-To: <1405936990-10656-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1405936990-10656-1-git-send-email-jukka.rissanen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jul 2014 11:55:05 +0100
Message-ID: <CAJTo0LZj_KrGLVXxkjJQPxQedTXUj9kOShm-Jk7RAcVxfZGD9Q@mail.gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: Fix PPTP VPN plugin QA issue
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
X-List-Received-Date: Mon, 21 Jul 2014 10:55:28 -0000
Content-Type: text/plain; charset=UTF-8

On 21 July 2014 11:03, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
> Fixing this error by skipping dev-so QA check for
> connman-plugin-vpn-pptp package.

As discussed on IM but repeating for the list, plugins should always
be real .so files and not symlinks to versioned files.

If a plugin is on disk as symlinks and versioned files, then you need
to pass more flags to libtool: -shared -avoid-version -module is the
canonical set to get a loadable module without a static counterpart
and versioned symlinks.

Ideally a few patches to the build will remove the need for every
dev-so insane skip in connman.

Ross

