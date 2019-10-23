Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 645687F82F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AD5799C0368;
	Wed, 23 Oct 2019 09:17:34 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id VfAj7aGc3by2; Wed, 23 Oct 2019 09:17:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 00E379C0392;
	Wed, 23 Oct 2019 09:17:34 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id bJzfOPupovZ7; Wed, 23 Oct 2019 09:17:33 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CEAE39C0368;
	Wed, 23 Oct 2019 09:17:33 -0400 (EDT)
Date: Wed, 23 Oct 2019 09:17:33 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <957676135.250492.1571836653788.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <CANNYZj9y0a7PgU2+vdBWYvbJYfUyHRCaZPfVjGmW0b2HY8Z=bA@mail.gmail.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<20191022090353.21151-2-jean-marie.lemetayer@savoirfairelinux.com>
	<CANNYZj9y0a7PgU2+vdBWYvbJYfUyHRCaZPfVjGmW0b2HY8Z=bA@mail.gmail.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC77 (Linux)/8.8.11_GA_3737)
Thread-Topic: npm.bbclass: refactor the npm class
Thread-Index: +Kc4Ug7h9DzbTzOstTiVaZA+9gOUyw==
Cc: paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/6] npm.bbclass: refactor the npm class
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
X-List-Received-Date: Wed, 23 Oct 2019 13:17:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Oct 22, 2019, at 1:35 PM, Alexander Kanavin alex.kanavin@gmail.com wrote:
> On Tue, 22 Oct 2019 at 11:12, Jean-Marie LEMETAYER <
> jean-marie.lemetayer@savoirfairelinux.com> wrote:
> 
>> The simplest solution is to let npm do its job. Assuming the fetcher
>> only get the sources of the package, the class will now run
>> 'npm install' to create a build directory. The build directory is then
>> copied wisely to the destination.
>>
> 
> I agree that npm dependency handing is a mess, and we should indeed let npm
> do the job.
> 
> However, 'npm install' pulls various things from the network; this can only
> be happen during do_fetch(), so that offline builds can continue to work.
> Whatever has been downloaded, needs to go to DL_DIR.

You are right, I am working on a v2 to fix this point.

> It also needs to be reproducible (there should be a guarantee that it
> always pulls the same set of sources which are verified through a checksum
> of some kind), I guess that can only be achieved through upstream provided
> shrinkwrap?

Yes, with current npm versions the "npm-shrinkwrap.json" [1] or the
"package-lock.json" [2] are both used to describe the dependency tree and
verify the integrity of the dependencies. This is what makes the build
reproducible. One of these files is mandatory to build the recipe (in the
source files or provided by the NPM_SHRINKWRAP variable).

For information the current 'node' version packed in meta-oe is '10.16.3'
which includes 'npm' version '6.9.0' [3].

1: https://docs.npmjs.com/files/shrinkwrap.json
2: https://docs.npmjs.com/files/package-lock.json
3: https://nodejs.org/en/download/releases/

Regards,
Jean-Marie

