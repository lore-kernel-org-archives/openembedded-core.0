Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D18978453
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 11:50:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 03:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,352,1505804400"; d="scan'208";a="1240258048"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2017 03:50:01 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
Message-ID: <499138bd-32cc-1487-e36e-fc4e5aceb4b2@linux.intel.com>
Date: Mon, 6 Nov 2017 13:50:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
Subject: automatic recipe upgrades - making them better and sweeter
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
X-List-Received-Date: Mon, 06 Nov 2017 11:50:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

I've been asked by RP to look into making automatic package upgrades 
work better, so here's what I'd like to improve:

1) when using 'devtool upgrade', remove the need to specify version and 
source revision on the command line, if we want to upgrade to the latest 
release. There is now distrodata/checkpkg code in place to determine 
both, so 'devtool upgrade <recipe>' could simply default to that.

2) help with LICENSE checksum changes a bit more; both devtool and AUH 
have some code for this, so I want to review what they do, and 
consolidate it in a single place. Maintainers should be able to see a 
diff of what the changes are.

3) 'devtool finish' currently does not handle the recipe upgrade 
situation well: the new recipe and patches are placed side by side with 
the current recipe. The old stuff should be removed, and a tentative 
commit should be created. So maybe add a 'devtool finish-upgrade'.

4) AUH should be stripped to its core business: sending useful emails to 
maintainers, and leave the rest to devtool. If 'devtool upgrade' 
succeeded, then corresponding patches should be attached, otherwise (if 
patch rebase failed, or a fetch issue), at least it could tell what 
happened and suggest a devtool upgrade command to get started. Any 
duplicate functionality for upgrading (stuff that is also in devtool) 
should be removed.

Anything I missed? Comments?

Thanks,
Alex

