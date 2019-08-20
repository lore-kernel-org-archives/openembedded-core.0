Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD787ECAD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 18:42:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2019 11:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="179825859"
Received: from pruecklm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.36.159])
	by fmsmga007.fm.intel.com with ESMTP; 20 Aug 2019 11:42:00 -0700
To: openembedded-core@lists.openembedded.org
References: <20190820090559.196193-1-kai.kang@windriver.com>
	<20190820090559.196193-2-kai.kang@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <e37dbfa4-eea3-ba19-da18-337cb7ec8ec3@intel.com>
Date: Tue, 20 Aug 2019 19:41:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820090559.196193-2-kai.kang@windriver.com>
Subject: Re: [PATCH 1/1] adwaita-icon-theme: workaround for do_populate_sysroot failure
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
X-List-Received-Date: Tue, 20 Aug 2019 18:42:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/08/2019 10:05, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It fails to run task do_populate_sysroot of adwaita-icon-theme rarely:
> 
> | DEBUG: Executing shell function sysroot_stage_all
> | cpio: ./icons/Adwaita/16x16/legacy/_inst.21134_: Cannot stat: No such
>    file or directory
> 
> In script ${S}/install-sh, temporary files _inst.* are created and will be
> removed by shell builtin command trap when the script exits:
> 
>      # Make a couple of temp file names in the proper directory.
>      dsttmp=${dstdirslash}_inst.$$_
>      rmtmp=${dstdirslash}_rm.$$_
> 
>      # Trap to clean up those temp files at exit.
>      trap 'ret=$?; rm -f "$dsttmp" "$rmtmp" && exit $ret' 0
> 
> The temporary files should be deleted already after task do_install. But
> somehow they are still exist until the gap between commands find and
> cpio in populate_sysroot function sysroot_stage_dir().

So does this only happen to adwaita-icon-theme?  Is it a bug in 
install-sh, so impacts almost every automake-using package?  Or is it a 
bug in how adwaita-icon-theme is using install-sh?

Ross

