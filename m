Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AC06077D43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 07:57:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 00:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,257,1488873600"; d="scan'208";a="1161583518"
Received: from lcosgrav-mobl1.ger.corp.intel.com (HELO [10.252.20.227])
	([10.252.20.227])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2017 00:57:03 -0700
User-Agent: Microsoft-MacOutlook/f.20.0.170309
Date: Thu, 27 Apr 2017 10:57:11 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <988DB900-794E-4D26-9611-96B3F3ABE570@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] oeqa.utils.metadata: cope with invalid lines
	in os-release file
References: <20170426143942.19020-1-markus.lehtonen@linux.intel.com>
	<1493218046.3433.25.camel@linux.intel.com>
In-Reply-To: <1493218046.3433.25.camel@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH] oeqa.utils.metadata: cope with invalid lines in os-release file
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
X-List-Received-Date: Thu, 27 Apr 2017 07:57:15 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 26/04/2017, 17.47, "Joshua Lock" <joshua.g.lock@linux.intel.com> wrote:

    On Wed, 2017-04-26 at 17:39 +0300, Markus Lehtonen wrote:
    > Don't crash if every line in /etc/os-release does not adhere to the
    > expected "key=val" format. E.g. CentOS 7 has empty lines in the file.
    > 
    > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
    > ---
    >  meta/lib/oeqa/utils/metadata.py | 6 ++++--
    >  1 file changed, 4 insertions(+), 2 deletions(-)
    > 
    > diff --git a/meta/lib/oeqa/utils/metadata.py
    > b/meta/lib/oeqa/utils/metadata.py
    > index cb81155e54..d291ddb960 100644
    > --- a/meta/lib/oeqa/utils/metadata.py
    > +++ b/meta/lib/oeqa/utils/metadata.py
    > @@ -20,8 +20,10 @@ def get_os_release():
    >          return None
    >      with open(os_release_file) as fobj:
    >          for line in fobj:
    > -            key, value = line.split('=', 1)
    > -            data[key.strip().lower()] = value.strip().strip('"')
    > +            split = line.split('=', 1)
    > +            if len(split) == 2:
    > +                key, value = split
    > +                data[key.strip().lower()] = value.strip().strip('"')
    
    We have a function to read os-release in oe.lsb, return_dict_osr().
    
    It handles this situation slightly differently, but the real reason I'm
    pointing this out is that it seems like we could factor out a shared
    function to be used both here and in oe.lsb ?


Thanks for spotting this. Makes sense to me. I'll send a new patch merging the two functions shortly.

Thanks,
   Markus



