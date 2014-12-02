Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3166C60232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 04:36:34 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id h15so14346864igd.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 20:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NAzgji9L2ej1c1LkGWM4m70kKbH+bJvKulHm0pyk95Y=;
	b=EfNxa6YiAj59Bp249myUPcsCem4KsRQUsTxJekve1VdxAhY+L63xvl+hdfmSe/Qyv3
	J77sLEVQIH89muF1hf5WIEBHsbJIE+bjmvXAHsar3mVAMfqbGp78RDENVNwNUDfMaRbE
	M0IebR1Zy/X47I6l0D9TutvJZ66r1rfPh4W6i4Ttl3KUcaIGcLbQnQm5MIlqvbntctUm
	IGu1Ik2/hJCWABQW/fpPiLn0rlX6GUH4naZBfKHfHjRGGq0BvUYMf1gQGLvZKKYhkHCc
	YdbTPsXvhEx1ILsyri2BDAkrr6B7YXPGR0tVKoB+K77ehyr+jGCNp1Wex8kr3WXxxNZs
	eYeA==
X-Gm-Message-State: ALoCoQlHWtr3wqoIXrUa80/VNA+C1MPXHXUlkErtNN0/NlOM4w2ytNmR9omg/zvcvdOyJzJam2pc
X-Received: by 10.42.95.208 with SMTP id g16mr1059605icn.81.1417494995211;
	Mon, 01 Dec 2014 20:36:35 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id 12sm7900003ios.32.2014.12.01.20.36.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 20:36:34 -0800 (PST)
Message-ID: <547D41C7.5020303@linaro.org>
Date: Mon, 01 Dec 2014 23:36:23 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5478B0A0.80609@linaro.org>
	<11435118.DSGP9nSeOe@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <11435118.DSGP9nSeOe@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 02 Dec 2014 04:36:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 12/01/14 05:11, Paul Eggleton wrote:
> On Friday 28 November 2014 12:28:00 Trevor Woerner wrote:
>> Perhaps any recipe you're working on could be automatically included via
>> an IMAGE_INSTALL_append in conf/local.conf (or maybe that's too intrusive?)?
> This is something I'd wanted to do - it's certainly something that should be 
> made easy, but I was concerned about causing a full reparse just because of 
> adding that to local.conf. (There might be a workaround through some sort of 
> packagegroup for containing the packages produced by the recipes in the 
> workspace that is added once when we create the workspace - maybe that's the 
> answer?)

Maybe even just printing a bit of text after a successful "add" to
inform the user that the just-added project isn't part of any image and
what they might want to do to include it?

The packagegroup sounds good too. But if the user doesn't want it
included, they might be confused about how it magically appeared, and
have some trouble finding how to remove it.

>> Do you envision users creating multiple workspaces? I'm wondering why
>> "devtool create-workspace" is required. Is there any advantage to
>> requiring users to create the workspace explicitly instead of just
>> having it be created implicitly?
> I wouldn't expect users to want to create multiple workspaces, but I did want 
> users to be able to (a) choose where their workspace would go and (b) know 
> that it has been created, so that the workspace layer showing up in the 
> configuration isn't a surprise.

I can't help think that there's no harm in an unused workspace (is
there?). Maybe the empty workspace from "create-workspace" should just
be created by default by the "oe-init-build-env" tool (or whatever a
given project is using).

If I were writing the documentation for this workflow, or giving a
presentation on it... I'm just trying to figure out how to justify the
extra, empty (but necessary) step of creating the environment before
using it. Maybe if someone tries to add a project before creating the
workspace, instead of erroring out, just run the create-workspace for
them with the defaults. If they're a power user who wants to put the
workspace somewhere specific then they're free to explicitly call
create-workspace on their own, otherwise it'll get called with the
defaults for them (or created automatically as part of the
oe-init-build-env).

To borrow the analogy from git: create-workspace is part of the pluming;
it's there if people what to call it explicitly, otherwise it gets
called implicitly with defaults?

