Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9230262134
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 15:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u59FNFnE023376; Thu, 9 Jun 2016 16:23:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yntFpZ-rcXD2; Thu,  9 Jun 2016 16:23:15 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u59FNDSH023373
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Jun 2016 16:23:14 +0100
Message-ID: <1465485793.13979.125.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jun 2016 16:23:13 +0100
In-Reply-To: <1465483659.36541.24.camel@ni.com>
References: <1465402114-1588-1-git-send-email-ovidiu.vancea@ni.com>
	<1465405170.13979.111.camel@linuxfoundation.org>
	<1465483659.36541.24.camel@ni.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 0/3] ipk/deb/rpm: add kernel version to its dependencies
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
X-List-Received-Date: Thu, 09 Jun 2016 15:23:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-06-09 at 17:47 +0300, Ovidiu-Adrian Vancea wrote:
> At do_package time I can't modify the variables RDEPENDS, RRECOMMENDS
> and RSUGGESTS as stated in the following email:
> http://lists.openembedded.org/pipermail/bitbake-devel/2013-April/0034
> 16
> .html

In general that email is correct, changes to the variables won't
propergate between tasks.

There is an exception in the do_package -> do_package_write_xxx
process. These use emit_pkgdata() to save the data and
read_subpackage_metadata() to read the data back in.

Not all variables are covered, but the ones you mention above are. As
long as you modify them somewhere during do_package such as adding a
function to PACKAGESPLITFUNCS, the changes will persist in the
packaging.

> I've tried the smallest changes to these 3 fields but without
> success,
> confirming what was said in the email.
> I do manage to get the auto pr data (Version=4.1+git168+a7e53ecc27-
> r0.73 - notice r0.73) that I need to version the dependencies.
> 
> At variable loading time I could globally change RDEPENDS,
> RRECOMMENDS
> and RSUGGESTS but I can't get the auto pr data. Since I have no auto
> pr
> data, I can go as far as getting Version=4.1+gitAUTOINC+a7e53ecc27-r0
> (notice r0, not r0.73) which is incomplete.
> 
> The only place I've actually managed to insert the data was at
> package
> creation time (ipk, deb, rpm), which I agree is ugly but I've not
> found
> another to get me where I need.

See above, I believe you can change these values and other recipes do
this as long as its somewhere within the do_package task.

Cheers,

Richard

