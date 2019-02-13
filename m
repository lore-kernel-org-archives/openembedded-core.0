Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE6C6BA22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 20:47:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1DKjD9L022125
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Feb 2019 12:45:44 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Wed, 13 Feb 2019 12:45:06 -0800
To: Jonas Bonn <jonas@norrbonn.se>, <Mikko.Rapeli@bmw.de>, <git@andred.net>
References: <20190211120433.16148-1-git@andred.net>
	<b5314b5aba8fc6e7ec104246463769932469576e.camel@andred.net>
	<20190211121551.GZ7474@hiutale>
	<64408b4d-195b-f89f-4202-5591f6c5c78b@norrbonn.se>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1a4ece94-0216-5ab2-695e-70817c6ae497@windriver.com>
Date: Wed, 13 Feb 2019 15:45:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <64408b4d-195b-f89f-4202-5591f6c5c78b@norrbonn.se>
X-Originating-IP: [172.25.44.4]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Wed, 13 Feb 2019 20:47:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2/13/19 5:00 AM, Jonas Bonn wrote:
> 
> 
> On 11/02/2019 13:15, Mikko.Rapeli@bmw.de wrote:
>> On Mon, Feb 11, 2019 at 12:08:46PM +0000, André Draszik wrote:
>>> Please ignore this patch. Looks like a red-herring. Sorry for the noise.
>>
>> FWIW, I would like to see this patch merged. Had some issues in the past
>> with busybox umount and added same change as a bbappend.
> 
> I'm also carrying a patch locally for this with the following explanation:
> 
> systemd passes the "-c" parameter (do not canonicalize) to the umount 
> command and busybox's umount does not understand this parameter.

With the current busybox do you really still see a problem since
busybox umount has been told to ignore "-c" now:
 
https://git.busybox.net/busybox/commit/?id=426134128112738c97a665170b21153ef0764b7d

    umount: ignore -c
"-c, --no-canonicalize: Do not canonicalize paths."

As busybox doesn't canonicalize paths in the first place it is safe to 
ignore
this option.

See https://github.com/systemd/systemd/issues/7786

Signed-off-by: Shawn Landden <slandden@gmail.com>
Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>


and that's released in:

$ git tag --contains 426134128112738c97a665170b21153ef0764b7d
1_29_0
1_29_1
1_29_2
1_29_3
1_30_0


and we have:
meta/recipes-core/busybox/busybox_1.29.3.bb



-- 
# Randy MacLeod
# Wind River Linux

