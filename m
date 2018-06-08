Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id C7751751FD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 17:13:19 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id w9-v6so11017884otj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eTbsQu1TM405HtnH8oB92VUoRKyyPahrJiy+p7VZve8=;
	b=cqbrxmjkPTI/TAgatHyY6mEGI1J4AirjgIdSKkdsb8LhVXBZhkPHdxMkS4aTZuRzmo
	/E92qn0KetH4MC0qQLEqFSiyAo5jFMgtOn03Rf44FLfilVFwM+LpBdrjmDp4qoJpJ/Rd
	15yHIDKOfdBFfOYcXpVtvKKUl89oejrgumkdsU++1MDk65qikaF/vU0m+A0hZRslim6K
	SLSqa6aL5v2kMhjEDLsFuCrbXyorZGdo7dQcjYlBuGi8lQgdkCqQLdSNus3FUtEiS6/X
	v8v1sSvSybBbrepPcy3GHJndgrQk1uqBzukt7ayutwW1rpOX4kBJm98cMwLoxmnVcs58
	2CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eTbsQu1TM405HtnH8oB92VUoRKyyPahrJiy+p7VZve8=;
	b=NIjMt4vTTwExEdfl8+3h0sRGrLUl41yVuTrQuVuDG06sJT13om/n8sgXlfOm7OP927
	eMAHOzDr3WGbpYHA2mZ9hcX9UftRPejFADT1WIfcRN49epGf+xOyEikeaFpwDmLjPQR1
	146YCua4vfCG90S4QP7ATduw0YwemQuKDu1XpEy1ChICFt+qJQ2ioD7hzpJmFo+4GoxD
	H5dYOE5n7z5ZEUSS3HciICuf/R6mMhX1AzT0PU200NucK7dOm19picsx5y04BEq6oZ4W
	pB+mnJIKFPiYVopbUvuDy2llt0dWeHBK0yuLaklwuvPrHbuyOw70/Y/TyXSUHQ3xhFfX
	cUIQ==
X-Gm-Message-State: APt69E0pSrnkMXQa2KZadOJ5WyYYXsMkBSC2rnm7FsrXwyV1NLnD2HHk
	ugbj7WIO8bKqBbCI+3oYoCLPP5NdDdmTq/jTZz4=
X-Google-Smtp-Source: ADUXVKJVZnDWaaadFwTKBqmTtf2jH09BXEsAMLgLbpoCOLOLkGuDJTYcAXpI/9Xh77N/Vmj4asTXJ73ZkdeoVXy8nLM=
X-Received: by 2002:a9d:50ad:: with SMTP id
	b45-v6mr3920753oth.102.1528478000805; 
	Fri, 08 Jun 2018 10:13:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 10:13:20 -0700 (PDT)
In-Reply-To: <20180608161841.10108-1-x-yo17@se-silbe.de>
References: <20180608161841.10108-1-x-yo17@se-silbe.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Jun 2018 20:13:20 +0300
Message-ID: <CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
To: Sascha Silbe <x-yo17@se-silbe.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection: relocate typelib repository for native builds
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
X-List-Received-Date: Fri, 08 Jun 2018 17:13:20 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-08 19:18 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
> gobject-introspection hard-codes the install path in the search path
> for the typelib repository, pretty much the same way glib behaves for
> the gio modules directory. Like for glib, this causes problems when
> gobject-introspection-native is restored from sstate with a different
> build directory.

Can you provide an example of how the problems can be reproduced
please? I think we disable building introspection data for -native,
and so where typelib dir is shouldn't matter?

Alex

