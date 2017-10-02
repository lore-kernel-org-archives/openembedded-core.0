Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C96BB72F63
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:00:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2017 07:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,469,1500966000"; d="scan'208";a="158380285"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 07:00:25 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"Burton, Ross" <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<d270479c-2e98-0211-1cc0-b7775a318d1b@linux.intel.com>
	<CAP9ODKopd3YGyd7wfz-Xyc+QDEJSJX3yeCwY7ced+aFAY4+Lgg@mail.gmail.com>
	<2adc6b6c-9538-bede-9235-b3642b0d5ccc@linux.intel.com>
	<CAP9ODKrjgs211OR+P3CBMbL9HhD1RK-bks7jky12NuqD49qmSA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bf43435d-1ad3-9be1-bb3f-9009a11a0767@linux.intel.com>
Date: Mon, 2 Oct 2017 16:56:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrjgs211OR+P3CBMbL9HhD1RK-bks7jky12NuqD49qmSA@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lib/oe/package_manager.py (rpm): Signature check is enabled by default
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
X-List-Received-Date: Mon, 02 Oct 2017 14:00:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2017 04:09 PM, Otavio Salvador wrote:

> I assure you I did test both patches. I leave as an exercise to you to
> show me what it breaks.
> 
> Also, keeping "exercises" for contributors is not something which
> helps to gather more contributions. It solved the dnf install
> requirement for my test and seems to be the right thing to do. I may
> be missing something but please point it or give me a case test.

The first patch is removing the addition of 'repo_gpgcheck=1' option to 
dnf config gile when repo feed signing/verification is enabled. Dnf does 
not enable that feature by default, and so the option must be present in 
dnf config file when repo feed signature verification is in use.

The second patch adds 'gpgcheck=0' when repo feed signing is disabled, 
which will also disable package verification at runtime, ignoring the 
altogether different build setting controlling that. As I've already 
explained to you, package signing and feed signing are two different 
things, with their own sets of options.

Test case 1:

- enable feed signing, check that resulting dnf.conf file has feed 
verification (repo_gpgcheck option) enabled

Test case 2:

- enable package signing, disable package feed signing, check that the 
resulting dnf.conf file has package verification enabled.

Both test cases will fail with your patches.

Alex

