Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4115161113
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:17:46 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so5264688vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Q0wF6kMFzoIsneT7/hz5Wg4f9LnygUuUow5Wuh3gK8I=;
	b=iTXungo+HXAMmGRqiujQCT4FKbAs163869t1pkWRF6tMBOdtEvgAtqfASISfWlJ54z
	vC13D6AeOjwVcfzFeJu0vbZINss5hgx/UmzcV9BdVUieRU1gZHRsVR+mPGf31TKL4xHD
	reHYb2vjG83GhESZcgarQVKwQJJnIhZcO1/t36pTG+oZIKUN0fz0utubyxzZc8e4+1bD
	DdlH8FGXBXPLDhLD7MT316RG3fDydHNn2671CxxrCb+8+38W7nN+olg5Dh7iXp88WWHg
	b7Sg0hZ9cf4EVCyyhFZv2yI4Vi5EBIUtaa+ypWB6rbSIw+ptgQqVh8JJkCrW8fxqUbbJ
	9OdQ==
X-Gm-Message-State: ALoCoQltfEiTYRoXUh5H5qDMaaJmz41HBMDCw5IkEG5nY5Ms0T84H57ki5rirwmEhdmVtaJd+STp
X-Received: by 10.58.155.6 with SMTP id vs6mr1225254veb.32.1378833467738; Tue,
	10 Sep 2013 10:17:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Sep 2013 10:17:27 -0700 (PDT)
In-Reply-To: <1378833306-27394-1-git-send-email-ross.burton@intel.com>
References: <1378833306-27394-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Sep 2013 18:17:27 +0100
Message-ID: <CAJTo0LaiEfUqXXz5UtaGzfFU2q1try_MHgbrUUViZcz=4jUXoA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base: improve PACKAGECONFIG handling logic
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
X-List-Received-Date: Tue, 10 Sep 2013 17:17:46 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2013 18:15, Ross Burton <ross.burton@intel.com> wrote:
> -                if num >= 3 and items[2]:
> -                    extradeps.append(items[2])
> -                if num >= 4 and items[3]:
> -                    extrardeps.append(items[3])
> -                if num >= 1 and items[0]:
> -                    extraconf.append(items[0])
> +                if items:
> +                    extraconf.append(items.pop(0))
> +                # Skip over disable
> +                if items:
> +                    items.pop(0)
> +                if items:
> +                    extradeps.append(items.pop(0))
> +                if items:
> +                    extrardeps.append(items.pop(0))

I should note that in a PACKAGECONFIG[foo] such as ",,,foo" this will
add some whitespace to EXTRA_OECONF and DEPENDS.  If this is a massive
concern I can sort it, but the clear code trumps the odd extra
whitespace in my mind.

Ross

