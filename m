Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBE2600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 11:08:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2015 04:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,468,1427785200"; d="scan'208";a="713594565"
Received: from lpobrien-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.32])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2015 04:08:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 12:08:22 +0100
Message-ID: <59677579.M5unJ8WNJB@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <f4ee80aed6d6c20ba6c01e92ec1495a5d20d6a58.1432122320.git.patrick.ohly@intel.com>
References: <cover.1432122320.git.patrick.ohly@intel.com>
	<f4ee80aed6d6c20ba6c01e92ec1495a5d20d6a58.1432122320.git.patrick.ohly@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] combo-layer: handle unset dest_dir in sanity_check()
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
X-List-Received-Date: Thu, 21 May 2015 11:08:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 May 2015 13:48:20 Patrick Ohly wrote:
> The previous "clean up dest_dir checking" patch (f8cdbe7497) improved
> handling of empty dest_dir but made handling of unset dest_dir worse:
> instead showing the "Option dest_dir is not defined for component ..."
> error, it fails with a Python exception.
> 
> Avoid that by providing a sane fallback for the unset case. With that
> change, dest_dir is no longer strictly required, but the check for it
> is kept to ensure that a combo-layer.conf also works with older
> combo-layer versions.
> 
> [Yocto #7773]
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  scripts/combo-layer | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index b0b7c28..698d3e3 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -145,8 +145,10 @@ class Configuration(object):
>                      msg = "%s\nOption %s is not defined for component %s"
> %(msg, option, name) missing_options.append(option)
>              # Sanitize dest_dir so that we do not have to deal with edge
> cases -            # (empty string, double slashes) in the rest of the
> code. -            dest_dir =
> os.path.normpath(self.repos[name]["dest_dir"]) +            # (unset, empty
> string, double slashes) in the rest of the code. +            # It not
> being set will still be flagged as error because it is +            #
> listed as required option above; that could be changed now. +           
> dest_dir = os.path.normpath(self.repos[name].get("dest_dir", "."))
> self.repos[name]["dest_dir"] = "." if not dest_dir else dest_dir if msg !=
> "":
>              logger.error("configuration file %s has the following error:
> %s" % (self.conffile,msg))

I suppose we might now tidy up the line that follows, but that's less critical 
than fixing the behaviour that this patch does. Therefore:

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

