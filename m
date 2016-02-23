Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4E5772B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:28:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2016 02:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,488,1449561600"; d="scan'208";a="909306448"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2016 02:28:39 -0800
Message-ID: <1456223318.2298.43.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 12:28:38 +0200
In-Reply-To: <cover.1455895912.git.adrian.ratiu@ni.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH v6 0/4] IPK signing for the gpg_sign module
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
X-List-Received-Date: Tue, 23 Feb 2016 10:28:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,
Resending as my I got a strange "Only members may post to the list."
error yesterday...

On Fri, 2016-02-19 at 17:45 +0200, Ioan-Adrian Ratiu wrote:
> This patch series extends the gpg_sign module to support ipk signing.
> 
> v6 implements Markus' feedback. The most notable change is the
> sign_ipk
> and detach_sign merger, as they were almost identical in
> functionality.
> This also meant a refactoring for detach_sign and a bug fix for the
> STDIN file descriptor introduced in gpg > 2.1.
> 
> Technically that STDIN bug is a feature (meh) of gpg >2.1 which
> breaks
> existing behaviour so we have to work around it i.e. check the gpg
> version and use the loopback interface. This means that gpg-agent to
> which gpg >2.1 always connects needs to be running permanently.
> 
> Ioan-Adrian Ratiu (4):
>   gpg_sign: add local ipk package signing functionality
>   gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
>   gpg_sign: export_pubkey: add signature type support
>   package_manager: sign IPK package feeds
> 
>  meta/classes/package_ipk.bbclass       |  5 +++
>  meta/classes/sign_ipk.bbclass          | 52 ++++++++++++++++++++++++
>  meta/classes/sign_package_feed.bbclass | 12 +++++-
>  meta/lib/oe/gpg_sign.py                | 74
> +++++++++++++++++++++++++++-------
>  meta/lib/oe/package_manager.py         | 17 +++++++-
>  5 files changed, 143 insertions(+), 17 deletions(-)
>  create mode 100644 meta/classes/sign_ipk.bbclass

I just realized that it would be good to add the ipk signing key to the
signing_keys.bb recipe.

However, it'd probably be good to write it on top of Randy Witt's
rework:
http://lists.openembedded.org/pipermail/openembedded-core/2016-February
/117791.html


Thanks,
 Markus

