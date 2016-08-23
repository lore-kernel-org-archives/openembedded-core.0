Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 111DD6067D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 17:16:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7NHGvag000873
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 23 Aug 2016 10:16:57 -0700
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 23 Aug 2016 10:16:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>, =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?=
	<jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LbHr7Bi20zYEG5+1383UkSb8=YmKATxOoP57DO-ZKX1Aw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <ff5fb210-3bed-d6e7-8c07-6c3a9079c90b@windriver.com>
Date: Tue, 23 Aug 2016 12:16:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbHr7Bi20zYEG5+1383UkSb8=YmKATxOoP57DO-ZKX1Aw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] [rpm] force a configure before make distclean
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
X-List-Received-Date: Tue, 23 Aug 2016 17:16:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 8/23/16 11:54 AM, Burton, Ross wrote:
> 
> On 23 August 2016 at 08:25, Jérémy Rosen <jeremy.rosen@smile.fr
> <mailto:jeremy.rosen@smile.fr>> wrote:
> 
>     -       ( cd ${S}/syck ; set +e ; rm -- -l* ; make distclean ) || :
>     +       ( cd ${S}/syck ; set +e ; rm -- -l* ; ./configure ; make distclean )
>     || :
> 
> 
> Running configure without all the options it needs to actually work just so that
> distclean works in a subbuild that shouldn't be breaking on rebuilds because we
> have out of tree builds scares me a little.
> 
> Mark, you added this line, can you remember what it was for?

The syck version can be preconfigured, and if it is -- it's wrong.

The 'set +e' is specifically in there to ALLOW it to fail.

If it is configured, we much remove the junk and clean it.. if it's not been
configured, we ignore the make distclean failure.

So I'm not sure why it is necessary to make the change.  'Failure is permitted',
and make distclean shouldn't be using any 'BUILD_CC' values from prior builds...
since it's only wiping everything that MAY have been previously built and leaked
into the release archive.

--Mark

> Ross


