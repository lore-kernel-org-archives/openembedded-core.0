Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 11DFB704E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:33:15 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so2302015qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 15:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kTqBCK6SVzgzTJATBqAJ/sjYUM+YESDH6phRxumJiRc=;
	b=Dh3Lz71TDnVyx2IbpaSvncyC5G/2ZUBE8vcKQiqN1Tvb/M2AH2oPYTsdK71tQecO8f
	j7MCAREZA/AZNH4o1I9ean9eFOO+gj9kPX4Mb6oKv+S/quJ/bal6+1yLajB2Yx1o5QTm
	r7uZv4znYNxi6zmxN1ODFUL2ALqaurjmrFjox7+uKj7J+OoNx4xGU6wzy5lXoWVd6rt4
	hnxa/OfaDKXPwm9H85ALJCCYPJS4/dwCdewEgRuW51ZlwB9wjQ2tWah06U5zQdpkdxhg
	+WJuejR456MskjxZeyujUlQ6nJg8ZaO2TLVVl+Qddc48JHJrERt76TLzX640k6eqjrF9
	ldVg==
X-Gm-Message-State: ALoCoQnlzRq0EP6awJrPUiPKgfwNJPito5k8Ak7A138BWaLCZWXmk8jdVYyCKu4lQV0Esak0haAJ
X-Received: by 10.224.111.195 with SMTP id t3mr254163qap.17.1406154796671;
	Wed, 23 Jul 2014 15:33:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Wed, 23 Jul 2014 15:32:56 -0700 (PDT)
In-Reply-To: <20140722162610.GV22875@jama>
References: <20140710164012.3BE7C503BE@opal.openembedded.org>
	<20140722162610.GV22875@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jul 2014 23:32:56 +0100
Message-ID: <CAJTo0LYjVnD_3UUuUeSGiNN1XJT8cTw9uCd9ND4P8_ZOKHo3yA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: debian.bbclass doesn't work in some setups Was: [oe-commits] Ross Burton : package.bbclass: add a stub implementation of package_name_hook
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
X-List-Received-Date: Wed, 23 Jul 2014 22:33:21 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2014 17:26, Martin Jansa <martin.jansa@gmail.com> wrote:
> 16:42 < rburton> JaMa: try moving debian after package_ipk
> 16:43 < rburton> (maybe we need an inherit package in debian)?
>
> 16:45 < JaMa> sorry, I've already started different build
>
> 16:46 < rburton> np
> 16:47 < rburton> easily tested outside of a build, i'll have a go in a bit
>
> since then I'm building with this change reverted

Moving debian to before package_ipkg does indeed replicate the problem
with an otherwise pure oe-core.  Adding "inherit package" to the top
of debian.bbclass appears to fix it - presumably because in your case
with the inherit order of debian and then package_ipk the second
definition of package_package_name_hook wins.

(export_functions isn't very nice, is it)

Patch incoming.

Ross

