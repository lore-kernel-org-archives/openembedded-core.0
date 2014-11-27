Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id ED2E07209B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 12:02:52 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 19574F811E2; Thu, 27 Nov 2014 05:02:53 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BF89CF811DB;
	Thu, 27 Nov 2014 05:02:49 -0700 (MST)
Message-ID: <547712F1.9090209@mlbassoc.com>
Date: Thu, 27 Nov 2014 05:02:57 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5476E26B.80003@topic.nl>
In-Reply-To: <5476E26B.80003@topic.nl>
Subject: Re: Deployment for machine X will remove its results from machine Y's deploy dir
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
X-List-Received-Date: Thu, 27 Nov 2014 12:03:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-11-27 01:35, Mike Looijmans wrote:
> Here's an example recipe to demonstrate the issue. Save it as "deployme.bb" into a recipe dir. Then build it for two machines. Building it for one machine will remove it from the
> deployment directory of the other. This problem has been bugging me for months, I had files just "disappear" mysteriously from the deploy directory and seemingly random times, and
> now I finally figured out what causes it.
>
> (cut here)
>
> SUMMARY = "Demonstrate a bug in OE deployment"
> DESCRIPTION = "Build this package for a machine X, then look at the image's \
>   deploy directory. You'll see a deployme.txt there. Now build it for another \
>   machine, e.g. "Y". The deployme.txt for machine X will have disappeared \
>   from the image dir. This appears to be a bug in OE's deployment."
> LICENSE = "GPLv2"
> LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
>
> inherit allarch deploy
>
> do_compile () {
>      echo "Hello world!" > deployme.txt
> }
>
> do_deploy () {
>      install -d ${DEPLOYDIR}
>      install -m 644 ${B}/deployme.txt ${DEPLOYDIR}/
> }
>
> addtask deploy before do_build after do_compile
>
> (cut here)

Very interesting & verified with the latest master.

Have you filed a bug?  https://bugzilla.yoctoproject.org/

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

