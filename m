Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDBA36EE4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 09:56:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D9uYVA005720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 01:56:35 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 13 Feb 2014 01:54:51 -0800
Message-ID: <52FC966A.6060701@windriver.com>
Date: Thu, 13 Feb 2014 17:54:50 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1389629682.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Thu, 13 Feb 2014 09:56:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Please hold on this, the recent changes of the prefuncs and postfuncs
on bitbake makes it doesn't work on gcc-*, I will send a V2.

// Robert

On 01/14/2014 12:20 AM, Robert Yang wrote:
> * The archive*.bbclass didn't work, and there were a few problems, for
>    example:
>    1) There were a few duplicated code
>    2) There was no src_dir.org (or orig), but the diff command still use
>       it, and it is not easy to fix this issue if we don't change a lot
>       of the code.
>    3) It didn't archive the source for the native or gcc
>    4) The work flow is not very well
>    5) The "subprocess.call('fakeroot cp xxxx'" should be removed
>    6) And others ...
>
> * So that we have to refactor it, the benefits are:
>    1) Fix the problems and make it work well.
>    2) Reduce more than 400 lines in total.
>    3) Make it easy to use.
>
> // Robert
>
> The following changes since commit 1b636173ca88e5ccca1992f9a12367a1189fa674:
>
>    bitbake: toaster: Toaster GUI, generic search, filter and order (2014-01-10 15:20:26 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib rbt/archiver
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/archiver
>
> Robert Yang (5):
>    classes/archive*.bbclass: remove archive-*-source.bbclass
>    archiver.bbclass: refactor it
>    package_rpm.bbclass: archive the source to srpm package
>    archiver.bbclass: move a few code to copyleft_compliance.bbclass
>    local.conf.sample.extended: update for the archiver
>
>   meta-yocto/conf/local.conf.sample.extended     |  72 +--
>   meta/classes/archive-configured-source.bbclass |  65 ---
>   meta/classes/archive-original-source.bbclass   |  65 ---
>   meta/classes/archive-patched-source.bbclass    |  65 ---
>   meta/classes/archiver.bbclass                  | 723 ++++++++-----------------
>   meta/classes/copyleft_compliance.bbclass       |  55 +-
>   meta/classes/package_rpm.bbclass               |  31 +-
>   7 files changed, 316 insertions(+), 760 deletions(-)
>   delete mode 100644 meta/classes/archive-configured-source.bbclass
>   delete mode 100644 meta/classes/archive-original-source.bbclass
>   delete mode 100644 meta/classes/archive-patched-source.bbclass
>

