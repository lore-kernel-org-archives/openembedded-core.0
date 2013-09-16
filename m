Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA236028B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 23:09:16 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so3485924veb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 16:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VX+O/np+Glw+RaoKaBeJoRcaf98ayapN9Aw/nmmja/4=;
	b=Mdes01HHcSTb6ubpZP10HdWmcA9NMcteCT9SiNicT6eGz6ImLlYHW7OHBJVNDcRUQc
	Ok74+xC2ZI8E9edEcdunkHq/kMdRA1PCeIvXdowK1feaRvukl6vrk2lpZhmX4elvpwS0
	b/D+cl7VkIKkf1JtfyeoFnOY2lp32/EpsW9zepKtRYlK6GHF0Cii0HG0wKq6chiKemYl
	pVA7dG0bjjViVdYJwKhbtiAuxsKJC7bKQhOpwQex0lBkPFkWNxLzTQeHF/4DmPmEN+yI
	5W+t9Pd3y5a7fhG3Q3ZeUC0Grqn2gp+HmE4n9G7o1BfE9X9mcggEmUJGk+5ft7nECixt
	q8UQ==
X-Gm-Message-State: ALoCoQlITAgNIhUcaA7rsVp7dsMmmbVt/PQmgsipcsqbPV1FFGNvTMNXsb/MO1ECquj5N0++uszI
X-Received: by 10.58.77.65 with SMTP id q1mr11100715vew.8.1379372957910; Mon,
	16 Sep 2013 16:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 16:08:56 -0700 (PDT)
In-Reply-To: <3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
References: <cover.1379148332.git.liezhi.yang@windriver.com>
	<3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Sep 2013 00:08:56 +0100
Message-ID: <CAJTo0LbRYeWRB-zOb3NvyH3ZtsOyQMeqKmm8a7xLCs7mpeG-jA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Mon, 16 Sep 2013 23:09:18 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2013 09:49, Robert Yang <liezhi.yang@windriver.com> wrote:
> There might be an error when parallel build:
>
> [snip]
> Traceback (most recent call last):
>   File "/path/to/tools/glib-gtypes-generator.py", line 304, in <module>
>     GTypesGenerator(dom, argv[1], argv[2])()
>   File "/path/to/tools/glib-gtypes-generator.py", line 295, in __call__
>     file_set_contents(self.output + '.h', ''.join(self.header))
>   File "/path/to/tools/libtpcodegen.py", line 42, in file_set_contents
>     os.rename(filename + '.tmp', filename)
> OSError: [Errno 2] No such file or directory
> [snip]
>
> This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
> write(remove/rename) _gen/gtypes.tmp at the same time, then there would
> be the error.
>
> Use ".NOTPARALLEL: _gen/gtypes.h _gen/gtypes-body.h" will fix the
> problem.

This is going to be a game of whack-a-mole as the root cause is the
bad temporary filename assignment in libtpcodegen.py.  Is there an
upstream bug for this?

Ross

