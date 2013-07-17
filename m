Return-Path: <Jate.Sujjavanich@myfuelmaster.com>
Received: from stspspam.syntech.org (exchsrvr.syntech-fuelmaster.com
	[199.44.250.2])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6556B205
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 23:19:02 +0000 (UTC)
Received: from pps.filterd (stspspam [127.0.0.1])
	by stspspam.syntech.org (8.14.5/8.14.5) with SMTP id r6HNFQ9W006231;
	Wed, 17 Jul 2013 19:18:49 -0400
Received: from courier.syntech-fuelmaster.com (courier.syntech.org
	[172.16.10.30]) by stspspam.syntech.org with ESMTP id 1cykfg5u67-1;
	Wed, 17 Jul 2013 19:18:49 -0400
Received: from Courier.syntech.org ([::1]) by Courier.syntech.org ([::1]) with
	mapi; Wed, 17 Jul 2013 19:18:49 -0400
From: Jate Sujjavanich <Jate.Sujjavanich@myfuelmaster.com>
To: "'Paul Eggleton'" <paul.eggleton@linux.intel.com>
Date: Wed, 17 Jul 2013 19:18:48 -0400
Thread-Topic: [OE-core] [PATCH] Checksums for local files now stored using
	partial recipe path
Thread-Index: Ac6CQZMmZALNs15mTAiaAtLHkuoR7AAuFvGA
Message-ID: <6C2434209962DC46B88345CA85C334A201CAA7D10C5A@Courier.syntech.org>
References: <1371653832-2178-1-git-send-email-jate.sujjavanich@myfuelmaster.com>
	<1409263.tPA0GAOlPL@helios>
	<6C2434209962DC46B88345CA85C334A201C9F4A6EBE9@Courier.syntech.org>
	<5246829.WLtotMrLQF@helios>
In-Reply-To: <5246829.WLtotMrLQF@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 05AFA6C7004CD005AFA814
acceptlanguage: en-US
MIME-Version: 1.0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0 phishscore=0
	adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=7.0.1-1305240000 definitions=main-1307170194
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-07-17_10:2013-07-17, 2013-07-17,
	1970-01-01 signatures=0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Checksums for local files now stored using partial recipe path
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
X-List-Received-Date: Wed, 17 Jul 2013 23:19:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> As far as I can tell though that won't actually fix the issue triggering
> rebuilds in your case. Something else must be changing. It would be
> interesting if you could dig into what that might be as I can't
> reproduce the rebuilding issue here.

I discovered that different versions of Dylan from git and the tarball were=
 causing the rebuilds to occur. Once I had the exact same version of dylan,=
 the entire build was pulled from sstate-cache.

My understanding now is that the recipe file dependencies changed for some =
recipes. Therefore the sorted checksums were modified triggering a rebuild.

> As I said earlier, if you look at the code only the checksum value goes
> into the task checksum and not the filename, so the path to the base of
> the metadata changing cannot influence the task checksum. However, I
> think I can see how you would think that the paths changing influenced
> the checksum, since the data that we put into the siginfo file *does*
> contain the full path, and thus bitbake-diffsigs will report that as
> having changed even though that difference didn't change the task
> checksum. That is a bug and we should fix how we store paths either in
> the cache or in the siginfo file, but that fix will have to take into
> account different layer paths. I'd suggest a simpler and more reliable
> approach would be to just get the relative path to os.path.dirname of
> the recipe rather than TOPDIR.

The full paths were a little confusing. I bet that the checksum differences=
 (or other changes) were at the bottom of the diffsigs output.

I have not had a chance to look at this again closely. When I do, I'll chec=
k out your suggestions.


- Jate S.


