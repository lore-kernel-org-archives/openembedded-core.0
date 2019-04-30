Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB0B7D258
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:04:39 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x3UC4dnd005899
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 30 Apr 2019 14:04:39 +0200
Received: from [139.16.79.72] (MD1FZU9C.ad001.siemens.net [139.16.79.72])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x3UC4dLg004026;
	Tue, 30 Apr 2019 14:04:39 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <20190430095917.3680-1-andrej.valek@siemens.com>
	<36c9eed229ab8b2bedc6e6903a5be396abc7d1de.camel@linuxfoundation.org>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <94c5b33e-8c56-fcb1-2c75-10fb4f1ebeac@siemens.com>
Date: Tue, 30 Apr 2019 14:04:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <36c9eed229ab8b2bedc6e6903a5be396abc7d1de.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/1] insane.bbclass: Add QA package check for mixed bins and libs
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
X-List-Received-Date: Tue, 30 Apr 2019 12:04:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 30.04.2019 12:26, Richard Purdie wrote:
>
> Merging a QA test which causes hundreds of warnings isn't really going
> to help unless we have a strategy for fixing it.
I agree merging this only makes sense if we commit to fixing the issue.

In my opinion the strategy for fixing it would be to always split packages that consists of both binaries and libs into two.
This is already done for many like sqlite3 (sqlite3 vs libsqlite3). This check would just ensure that this rule is always followed.

This would make it easier to separate the two. Let's take the example that you have two applications A (32bit) and B (64bit) both using sqlite3.
In this case the two would link to lib32-libsqlite3 and libsqlite3.

If the package contained both the library and the binary you would end up with both libs but one of the two binaries (not sure this is deterministic).
If the packages are only lib and only binary then you would explicitly need to select either the 32bit or the 64bit variant.

In practice this would not only benefit the multilib case. It would also help with avoiding unnecessarily installed binaries just because somebody is using a library
bundled in the same package.

>
> As I understand it, if you install python 32bit and 64 bit, you should
> get the libraries from both but only the binaries from the one that
> wins. That should mean anything linking to the lib should work?
>
> What am I missing? Is something not working like that? Is this with the
> rpm or opkg implementation? (they're very different)
I think the issue with scripting languages (especially python) is different from the general case above (sqlite3).
And maybe the insane check in the current form is not covering all cases.


Pascal

