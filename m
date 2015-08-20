Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7C981766DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 13:47:26 +0000 (UTC)
Received: by iods203 with SMTP id s203so46377580iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 06:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=TR9q9Va/RqKY4E/RYXJJGIE6kOLi1Y9W2peTrdakXvo=;
	b=jeswtnkr1bOEsuSooehdDywFe0FYeMcGyELyQ1cqy5UjiwQZEKo+VHu0s2tMCDOzWW
	okGxkU1oOl72habXuDvoGPrJFDpH/tyCeQs3dDrXPo//wwdcJRjQuUo492Sbg7YFu2EJ
	V1eh1LZySpokdpvapANayjNP0nYOu4TtAxTpjZGSiYTQZNo6+1v2zIEOxFnlmtAJI0je
	DuagPe0cvdnkcryKlLt90R9A4/ai+jcskjlXYycVQASU6VAo/W2ZcOzqVJIHcfjDS0e6
	XbJCX4HsObZ7O88YyXgZMjywzZTlNIM+w2i3pSbTN4W2CnoQN/m38/4Yvie0BvDtN7Xv
	FRow==
X-Gm-Message-State: ALoCoQlRCMYNy/fx/JIZcyho1tB3Evj4VofK4pEBMh7pjzbfT0vRpHEavEUCq4SaNdAzHFbMkPnT
X-Received: by 10.107.15.209 with SMTP id 78mr2609187iop.51.1440078446916;
	Thu, 20 Aug 2015 06:47:26 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C81A.dip0.t-ipconnect.de. [93.232.200.26])
	by smtp.gmail.com with ESMTPSA id hs4sm4913078igb.7.2015.08.20.06.47.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 06:47:25 -0700 (PDT)
Message-ID: <1440078442.17136.60.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 20 Aug 2015 15:47:22 +0200
In-Reply-To: <d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Thu, 20 Aug 2015 13:47:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-19 at 14:34 +0100, Paul Eggleton wrote:
> Allow restricting recipes brought from a layer to a specified list. This
> is similar in operation to blacklist.bbclass, but instead specifies a
> per-layer whitelist of recipes (matched by BPN) that are able to be
> built from the layer - anything else is skipped. This is potentially
> useful where you want to bring in a select set of recipes from a larger
> layer e.g. meta-oe.

Worked for all of my tests. I added all layers in meta-openembedded and
then white-listed just gmock in meta-oe (aka openembedded-layer):

INHERIT += "whitelist"

PNWHITELIST_efl-layer = "no-recipe-enabled"
PNWHITELIST_filesystems-layer = "no-recipe-enabled"
PNWHITELIST_gnome-layer = "no-recipe-enabled"
PNWHITELIST_gpe-layer = "no-recipe-enabled"
PNWHITELIST_meta-initramfs = "no-recipe-enabled"
PNWHITELIST_meta-python = "no-recipe-enabled"
PNWHITELIST_multimedia-layer = "no-recipe-enabled"
PNWHITELIST_networking-layer = "no-recipe-enabled"
PNWHITELIST_openembedded-layer = "gmock"
PNWHITELIST_perl-layer = "no-recipe-enabled"
PNWHITELIST_ruby-layer = "no-recipe-enabled"
PNWHITELIST_systemd-layer = "no-recipe-enabled"
PNWHITELIST_toolchain-layer = "no-recipe-enabled"
PNWHITELIST_webserver = "no-recipe-enabled"
PNWHITELIST_xfce-layer = "no-recipe-enabled"

I got warnings for several of the layers, but strangely not for all of
them:

WARNING: No bb files matched BBFILE_PATTERN_efl-layer '^/work/meta-openembedded/meta-efl/'
WARNING: No bb files matched BBFILE_PATTERN_filesystems-layer '^/work/meta-openembedded/meta-filesystems/'
WARNING: No bb files matched BBFILE_PATTERN_gpe-layer '^/work/meta-openembedded/meta-gpe/'
WARNING: No bb files matched BBFILE_PATTERN_meta-initramfs '^/work/meta-openembedded/meta-initramfs/'
WARNING: No bb files matched BBFILE_PATTERN_multimedia-layer '^/work/meta-openembedded/meta-multimedia/'
WARNING: No bb files matched BBFILE_PATTERN_networking-layer '^/work/meta-openembedded/meta-networking/'
WARNING: No bb files matched BBFILE_PATTERN_perl-layer '^/work/meta-openembedded/meta-perl/'
WARNING: No bb files matched BBFILE_PATTERN_meta-python '^/work/meta-openembedded/meta-python/'
WARNING: No bb files matched BBFILE_PATTERN_ruby-layer '^/work/meta-openembedded/meta-ruby/'
WARNING: No bb files matched BBFILE_PATTERN_webserver '^/work/meta-openembedded/meta-webserver/'
WARNING: No bb files matched BBFILE_PATTERN_xfce-layer '^/work/meta-openembedded/meta-xfce/'

Note that gnome-layer is not warned about, although none of its recipes
are enabled (checked with "bitbake-layers show-recipes -f | grep -v
'(skipped)' | grep meta-gnome"). Any idea why?

One more comment: it would be slightly nicer if empty whitelist could be
distinguished from no whitelist, with "empty" meaning "enable no
recipes". In other words, replace "if whitelist" with "if whitelist is
not None".

I want to list all PNWHITELIST_xxx values for meta-openembedded, even
when the layer is not (yet) in bblayers.sample.conf, in order to be
prepared for adding it later. Doing that with an empty string is more
readable than with a fake recipe name to make the variable non-empty.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




