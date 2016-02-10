Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB35365CBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 00:25:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1A0PeDx015620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 9 Feb 2016 16:25:40 -0800
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 16:25:39 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <cover.1455047631.git.peter.seebach@windriver.com>
	<56BA47DD.6020007@windriver.com>
	<CALbNGRQfNy=M5Y-zQXgXb-nQcbNKe5G_3D816HnK37w2Lag1SA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56BA8383.7010109@windriver.com>
Date: Tue, 9 Feb 2016 18:25:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRQfNy=M5Y-zQXgXb-nQcbNKe5G_3D816HnK37w2Lag1SA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] pseudo 1.7.5 [jethro][fido]
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
X-List-Received-Date: Wed, 10 Feb 2016 00:25:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 2/9/16 3:52 PM, Andreas Müller wrote:
> On Tue, Feb 9, 2016 at 9:11 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Once the corresponding tarball is available, this should likely be
>> backported/merged to Jethro and Fido as well.
>>
>> Everything remains compatible, but it does fix a subtle race condition that can
>> lead to files under pseudo control inheriting their host system permissions.
> Are user IDs affected? If yes there would be a chance to reduce loads
> of host contamination warnings..

There are two pieces to this issue.

The first is the most common place people will see it.  Running a buildhistory,
the wrong file attributes are displayed.  These include xattr, owner, group and
permissions.  Note, in THIS case they are most likely correct in the package,
only buildhistory sees the wrong values.

The second is a lot less likely from what we saw, but IS possible, and we have
seen a few of these in real situations.  The problem occurs during a do_install
or other place and the wrong file attributes (see above) are inherited from the
environment.  In modern systems this, in my experience, always manifests itself
with a QA warning -- rebuilding the package the problem goes away.

Both of the above cases are believed to be fixed with the new version.

--Mark

> Andreas
> 


