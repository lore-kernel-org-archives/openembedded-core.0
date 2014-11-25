Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 25746721D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:51:45 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id w7so829698qcr.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=gPiAZ52S1S6GD0yHgfLKPpHeMFcu5jbjmReCC8MsdB8=;
	b=o3y/SHekzyab7uFNxPSLq0b1uYzuw4ApyYCQHd1qF2zS8e8+zK9fKJLIptR9RnNAvs
	kqnoS+CWdITd2Wym44Uap9jQCwrQS8yIPsf6cKLpWf9lnpcvryUUyYlHjUK1rsuEUoFC
	UARaXdb0gN68nkxnfAZUSQZqyLTDZBjYd77nyge9LXWlGciFi5Cwj3bdgBZRhN22OjTz
	Vz3J7xG1Sqz1qaNS6K2dL+SH9C4F5eyNI+/WRVUDt3OI649PcCwxpKzyBGyDkLxPpmCh
	JNFHuVBdR7xlT7miRNipQZ3Dmk8g8alBqpgYN0EF+X5MQ6iFRIclX5BjwkOJOOmWLxSe
	6unA==
X-Received: by 10.140.81.6 with SMTP id e6mr3824543qgd.90.1416937905918; Tue,
	25 Nov 2014 09:51:45 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Tue, 25 Nov 2014 09:51:05 -0800 (PST)
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 25 Nov 2014 17:51:05 +0000
X-Google-Sender-Auth: v3_7XAB87x_eSXkLvTKPqUub2RA
Message-ID: <CANyK_8c3FpjQ2p1sKtg3Gz7NJp6sC-74o8mZgziHtoOKAe3oOw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 25 Nov 2014 17:51:46 -0000
Content-Type: text/plain; charset=UTF-8

On 25 November 2014 at 17:28, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> [Note: this is an RFC series for the moment, and shouldn't yet be merged.]
>
> I've been looking at how to make it easier for application and system
> component developers to get their work done using the tools we provide,
> and I believe this patchset is a piece of the solution. There's still a
> number of other pieces to come, but this should be usable on its own.
>
> The first three patches extend the PATCHTOOL = "git" code to ensure that
> we're able to apply all patches even if "git am" and "git apply" can't
> handle them, and that we do a commit to the repository per patch. This
> is needed for devtool later on.
>
> I've then added a new recipe auto-creation script, recipetool, which can
> take a source tree or URL and create a skeleton recipe to build it.
> (In case anyone is wondering about the existing scripts/create-recipe,
> frankly I consider it a dead end - it's written in Perl, which makes it
> a bit difficult to integrate with the rest of our code; it's also
> GPLv3-only which makes any such integration pretty much impossible from
> another angle.)
>
> Then we add devtool. This allows you to:
>
>  * Add a new piece of software (auto-create the skeleton of a recipe
>    using the aforementioned recipetool and point the build to an external
>    source tree)
>  * Modify the source for an existing recipe (point the build to an
>    external source tree, possibly creating that tree in the same step
>    and managing it with git)
>  * Deploy the installed files from a recipe from ${D} to a target using
>    scp.
>
> There will obviously be extensions to these tools, but I hope they are
> already functional enough to be useful at the state they are in at the
> moment.
>
> Known issues:
>
>  * "devtool modify" can't currently deal with gcc, linux-yocto or perf
>    because they manage their workdir differently, this will need to be
>    fixed
>  * devtool's workspace layer triggers a bitbake warning when empty.
>    I suspect a mechanism to disable this warning internally will need to
>    be added.
>  * "recipetool create" ideally needs to become smarter and fill in
>    more details of the recipe. At some point we'll probably have to
>    make the process interactive and possibly have it automate parts of
>    the build process and examine the output; some things just can't be
>    practically detected from the source tree without building.
>
>
> (Note that some pieces of the code which are not essential rely on a couple
> of changes to bitbake, you can find these in the paule/devtool-bb branch
> in poky-contrib, or if you are happy to use poky, grab the paule/devtool
> branch in poky-contrib which has everything).
>
> Comments/questions/suggestions welcome!
>

This sounds great and looks like it will make some regular tasks quite
a bit easier!

One thing which may be useful within recipetool or devtool is a single
command to create patch files (using `git format-patch`), put them
into the relevant directory and add the file names to SRC_URI.
Obviously this assumes the external source tree is a git repo and we
can trace the local modifications back to either an external master
branch or an initial state after extracting a source archive. I'm just
thinking out loud here though, depends if other people think that work
flow is common enough to be worth creating a shortcut for.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

