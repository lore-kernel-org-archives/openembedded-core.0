Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id DC93B6E7A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 12:41:16 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id e16so3570760qcx.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 04:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/TPTpBO2+Qhayq0U1I+oZ3HeeQENpL+LawHL7cZYjhM=;
	b=CJrLKqyCSA2aY73CWWSRoyt5/Zz4yVaP0FYEc/L9tmpQNXvvxXnO+oUhx1hlICZnar
	Qa9ZCsJ66dKQghNYm1zzdJY68+Aj3rlTyVwfeGfls5t2CItFXQ/hekAIxhlYmzDZoiCy
	hal6EZyzuOkG9/kJxiD4lXApbOnIB/0bugPtghos0aXShnJAP1fkmCpYpUDqQiih4fF0
	osEoJ5WM2qKo0RyTyMte5JrSVizCpLyVH/CGSjGbsevcchYEBOBsCRF9OjA5lgd8ooey
	fdi8yYBWHthB5MXHyaTdgoiCPPyJjj+XteOqpxviDETDrOgK0xpMeuvknH7i+5oeKlMt
	txrg==
X-Gm-Message-State: ALoCoQmBBnByG6S4tMo0NyZQVTIMck7GQU+pdhqorFk0n6IcJpwY+d32nwg+GKM0S/4NjXshBFEb
X-Received: by 10.140.106.225 with SMTP id e88mr35185583qgf.66.1393332077707; 
	Tue, 25 Feb 2014 04:41:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 25 Feb 2014 04:40:57 -0800 (PST)
In-Reply-To: <cover.1393256563.git.liezhi.yang@windriver.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Feb 2014 12:40:57 +0000
Message-ID: <CAJTo0LYcmGFV6kW0+fHO8mhP0anPkxFG4_zJfC5PQ1iOwU3zow@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5 V2] refactor the archiver*.bbclass
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
X-List-Received-Date: Tue, 25 Feb 2014 12:41:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

One point: enabling the archiver causes the stamps for various steps
to change (fetch, configure, package: wherever it hooks) which means a
full rebuild.  Can the archiver hide itself from the stamps so this
doesn't happen?

This appears to be some of the work required:

+do_configure[vardepsexclude] += "do_deploy_archives"
+do_patch[vardepsexclude] += "do_create_diff_gz"
+do_unpack[vardepsexclude] += "do_ar_unpacked"

But I'm still getting a stamp change in do_package that I haven't
chased down yet.

Ross

On 24 February 2014 15:56, Robert Yang <liezhi.yang@windriver.com> wrote:
> === V2:
> * Fix the warning between different machines which is reported by Martin
> * Fix the error when the archiver.bbclass is not inherited but
>   ARCHIVER_MODE[type] = "srpm" is set, reported by Ross.
> * Fix the archiving for gcc staff which uses the shared source according
>   to the recently changes of prefuncs and postfuncs in bitbake, so it only
>   works well with bitbake's up to date master branch, if we want to backport it,
>   we also need backport the pre/postfuncs related patches.
>
> === V1:
> * The archive*.bbclass didn't work, and there were a few problems, for
>   example:
>   1) There were a few duplicated code
>   2) There was no src_dir.org (or orig), but the diff command still use
>      it, and it is not easy to fix this issue if we don't change a lot
>      of the code.
>   3) It didn't archive the source for the native or gcc
>   4) The work flow is not very well
>   5) The "subprocess.call('fakeroot cp xxxx'" should be removed
>   6) And others ...
>
> * So that we have to refactor it, the benefits are:
>   1) Fix the problems and make it work well.
>   2) Reduce more than 400 lines in total.
>   3) Make it easy to use.
>
> // Robert
>
> The following changes since commit 0e5cfef90ff762b33da6dc301dfc9cb3947c8a02:
>
>   runqemu: enforce right CPU type for qemux86/x86-64 (2014-02-13 17:48:47 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/archiver
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/archiver
>
> Robert Yang (5):
>   classes/archive*.bbclass: remove archive-*-source.bbclass
>   archiver.bbclass: refactor it
>   package_rpm.bbclass: archive the source to srpm package
>   archiver.bbclass: move a few code to copyleft_compliance.bbclass
>   local.conf.sample.extended: update for the archiver
>
>  meta/classes/archive-configured-source.bbclass |  65 ---
>  meta/classes/archive-original-source.bbclass   |  65 ---
>  meta/classes/archive-patched-source.bbclass    |  65 ---
>  meta/classes/archiver.bbclass                  | 735 ++++++++-----------------
>  meta/classes/copyleft_compliance.bbclass       |  55 +-
>  meta/classes/package_rpm.bbclass               |  31 +-
>  meta/conf/local.conf.sample.extended           |  72 +--
>  7 files changed, 327 insertions(+), 761 deletions(-)
>  delete mode 100644 meta/classes/archive-configured-source.bbclass
>  delete mode 100644 meta/classes/archive-original-source.bbclass
>  delete mode 100644 meta/classes/archive-patched-source.bbclass
>
> --
> 1.8.3.1
>

