Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8856771E10
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:53:38 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id v186so129128172lfa.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 05:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YEL0HC4z3XxVZ/Lk48DSzrG0vtps2x5jO9+2ZUhhxI0=;
	b=Zv4j+mhZLM6etBaPBOu6Sk6g6Cd15l48n8HEXuJy3UbED4OiEwS4cwbC2JOmzJFABj
	bhmY5LCcl4RUxqRZFkeQbdPe7PeF141/KAC8i8hE5ohpQdooVi3wZC0gJpF3wFGXRpe3
	DeXBZGZppaxFxJJ6lx1TN61bGGnDItCCiElJYClXZEI6YaVArfheZuFJSOa4/GOq1UAD
	xmqkJrvW1614BJFYl0qMzdkay366eaVA35/CM7J7qXt7L+henHZd1KNS7K1e8DGdwZXh
	5cDUA/A1IbBpKoUNNlVBMk9XjhtNo4Sh171K91LzPt1sSkvEtFRKor997WTMDedFt8KH
	Zaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YEL0HC4z3XxVZ/Lk48DSzrG0vtps2x5jO9+2ZUhhxI0=;
	b=gvbPSyOTPTbO8Dgfk2C8POs4Z+enhn29i8LzOL180jmxSIFenTVWO7XdlEOQs+5Yvm
	90JM9DfRd0xBYEQyJ0RnJiEGfEu+gS1ytzjA+zpaQhsClef3MQSMOTKiSF/fYK581/Nh
	N/rGlp9SXAsNSrS52rT3GWwp4Ues7l7Gj0MCcM6nvTNW4p/t+3dNXKbGzAMOaagJ7yjI
	BUgEg98SrD1b0zUyzg5pFiy1AO7ZbJoUR2ud92QMtsCbAUib66q13inWXXV4rpdj/nnj
	ilU7iErFvAajBma8BmMp8Iwruh4+zChbzUXikO3pcR9+aStnxjt7HXNKOhbLuYGrbPyo
	kOgw==
X-Gm-Message-State: AIkVDXLhBXyXHmT8XidQpE2go0uFtyudAwU8JYvSeGAurYCcCRG9O8Gd10cgRehj/Wyzng==
X-Received: by 10.25.34.196 with SMTP id i187mr13225901lfi.176.1485352418742; 
	Wed, 25 Jan 2017 05:53:38 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	t9sm1119941lja.48.2017.01.25.05.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 05:53:37 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 25 Jan 2017 14:53:16 +0100
Message-Id: <1485352397-18383-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485347971.30673.95.camel@linuxfoundation.org>
References: <1485347971.30673.95.camel@linuxfoundation.org>
Subject: Re: Overriding fixmepath
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
X-List-Received-Date: Wed, 25 Jan 2017 13:53:40 -0000


>> Take a look at the attached file, to me the inclusion of .a files in
>> the
>> fixmepath file seems wrong, so I can start with that, unless you have
>> better idea.
> 
> I think this is a very good lead. The code searches for replacements to
> make with: "grep -Irl" (see sstate.bbclass) and it looks like its
> matching these files and shouldn't. We may need to make sstate.bbclass
> look something like:
> 
> SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
> SSTATE_SCAN_CMD_NATIVE ?= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}'
> 
> and then:
>     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d):
>         d.setVar('SSTATE_SCAN_CMD', '${SSTATE_SCAN_CMD_NATIVE}')
> 
> which means you'd be able to override the command being used to exclude
> .a files?

Thanks, good suggestion!

In order to make this overridable from any recipe, may I propose the following
patch instead? It has the advantage of avoiding the Python logic altogether, and
using weak defaults so that it can be easily overridden. One thing to note is
that I couldn't find the "sdk" class that was referenced in the Python
code. Does it exist anymore?

The mentioned patch is what I used, and it worked for me when I also added:

  SSTATE_SCAN_CMD = "true"

to the Go recipe.

-- 
Kristian

