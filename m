Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B60996D561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:43:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2019 02:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="179765970"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by orsmga007.jf.intel.com with ESMTP; 25 Sep 2019 02:43:50 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1569380793.git.Qi.Chen@windriver.com>
	<1b92d4ed4d0d7fbd91d56d28e32f3249e8fbdf72.1569380793.git.Qi.Chen@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c16d378a-95c3-f223-420e-45718df77bdb@intel.com>
Date: Wed, 25 Sep 2019 10:43:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1b92d4ed4d0d7fbd91d56d28e32f3249e8fbdf72.1569380793.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] systemd: mark /etc as updated to avoid unnecessary services to run
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
X-List-Received-Date: Wed, 25 Sep 2019 09:43:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 25/09/2019 04:07, Chen Qi wrote:
> We have updated hwdb via postinstall, updated systemd users via
> 'systemd_create_users', so there's no need to update /etc. Mark it
> as updated to avoid unnecessary services like systemd-hwdb-update.service
> to run.
> 
> This would solve timeout problem on qemumips. So also remove the
> timeout change for systemd-hwdb-update.service.

I was going to send almost this exact patch, *but* I don't think it's right.

Arbitrary service files can use ConditionNeedsUpdate, and marking /etc 
as updated because we don't want hwdb-update to run also means we don't 
execute ldconfig.service, systemd-sysusers.server, or any other service 
files that were added and expected to be ran on first boot.

Some other distributions rip out systemd-hwdb-update entirely and use 
traditional postinsts to handle it:

Debian: 
https://salsa.debian.org/systemd-team/systemd/blob/master/debian/rules#L221
Clear: 
https://github.com/clearlinux-pkgs/systemd/blob/master/systemd.spec#L419

I believe that we should do the same.

Ross

