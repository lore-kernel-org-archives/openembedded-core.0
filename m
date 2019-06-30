Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A0AE17D251
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 20:24:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2019 13:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,436,1557212400"; d="scan'208";a="153887410"
Received: from sieumunt-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.154.37])
	by orsmga007.jf.intel.com with ESMTP; 30 Jun 2019 13:24:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Mon, 01 Jul 2019 08:24:26 +1200
Message-ID: <2269427.UxezG6JHts@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <c2dc0472ed9646f680f658e4297eb4df@xbox06.axis.com>
References: <c2dc0472ed9646f680f658e4297eb4df@xbox06.axis.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] devtool: warn user about multiple layer having the same base name
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
X-List-Received-Date: Sun, 30 Jun 2019 20:24:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,

On Friday, 28 June 2019 10:09:22 PM NZST Peter Kjellerstedt wrote:
> I had not realized the layer name in the devtool finish command supports
> abbreviations/patterns (whichever it is). My expectation from running
> `devtool finish foo meta` would be to update the foo recipe in the meta
> layer,  not that it should go looking for every layer called meta-something.

That's not how it works. The logic is here:

  https://git.openembedded.org/openembedded-core/tree/scripts/lib/devtool/standard.py#n1866

We only have the subdirectory the layer is in to use to determine what the name of the layer is, if you only specify the name. The only shortcuts in this function are "oe-core" and "openembedded-core" map to "meta". The case this patch is attempting to handle is where you have more than one layer in your configuration where the subdirectory in which the layer appears is called "meta". (People should generally avoid this and put the layer in a subdirectory whose name matches the name of the layer, but of course people can do whatever they want.)

Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



