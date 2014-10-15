Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7CB771902
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 07:54:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9F7rxXk017739
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Oct 2014 00:54:02 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 15 Oct 2014 00:54:00 -0700
Message-ID: <543E2810.3040102@windriver.com>
Date: Wed, 15 Oct 2014 15:53:52 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <cover.1413352525.git.hongxu.jia@windriver.com>
	<19a9c5389b842d65e4d0e3a5068d9404bb5324ac.1413352525.git.hongxu.jia@windriver.com>
In-Reply-To: <19a9c5389b842d65e4d0e3a5068d9404bb5324ac.1413352525.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain build failure
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
X-List-Received-Date: Wed, 15 Oct 2014 07:54:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2014 01:59 PM, Hongxu Jia wrote:
> @@ -61,7 +61,7 @@ class RpmIndexer(Indexer):
>                   eext = ext.split(':')
>                   if len(eext) > 1 and eext[0] == 'multilib':
>                       localdata = bb.data.createCopy(self.d)
> -                    default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
> +                    default_tune_key = "DEFAULTTUNE_ML_" + eext[1]
>                       default_tune = localdata.getVar(default_tune_key, False)
>                       if default_tune:
>                           localdata.setVar("DEFAULTTUNE", default_tune)

It caused build failure of meta-toolchain, in order to avoid it, we
should use DEFAULTTUNE_virtclass-multilib-lib32 first, if it is not
available, and try to use DEFAULTTUNE_ML_<multilib>

So it does not affect previous build workflow.

Please drop it, V2 incoming

//Hongxu


