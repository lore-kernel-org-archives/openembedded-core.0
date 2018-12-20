Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF31E79F49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 06:45:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBK6j7g5021429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Dec 2018 22:45:18 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 19 Dec 2018 22:44:57 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1545202218.git.liezhi.yang@windriver.com>
	<f8c21c17d3ad2ca31c4b26b23b74ab0bdefd2c77.1545202218.git.liezhi.yang@windriver.com>
	<CAJTo0LZOd5hFgFWqvYL2ucusTLCNymf9Jo__yf5Hd1SGeCytrA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9bc35e55-7246-76eb-8726-bb717ad5979c@windriver.com>
Date: Thu, 20 Dec 2018 14:50:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZOd5hFgFWqvYL2ucusTLCNymf9Jo__yf5Hd1SGeCytrA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cmake-native: Set --parallel for configure
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
X-List-Received-Date: Thu, 20 Dec 2018 06:45:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/19/18 6:37 PM, Burton, Ross wrote:
> On Wed, 19 Dec 2018 at 06:34, Robert Yang <liezhi.yang@windriver.com> wrote:
>> +               --parallel=${@d.getVar('PARALLEL_MAKE').replace('-j ', '')} \
> 
> See oe.utils.parallel_make_argument()

Thanks, updated in the repo:

commit 19ac4e33e66353581191e7dfd866f6c0f73eafa6
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Dec 18 17:48:22 2018 +0800

     cmake-native: Set --parallel for configure

     This can save do_configure's time from 330s to 60s on my host.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb 
b/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
index 9a1390f..3086c82 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
@@ -27,7 +27,9 @@ CMAKE_EXTRACONF = "\
  "

  do_configure () {
-       ${S}/configure --verbose --prefix=${prefix} -- ${CMAKE_EXTRACONF}
+       ${S}/configure --verbose --prefix=${prefix} \
+               --parallel="${@oe.utils.parallel_make_argument(d, '%d')}" \
+               -- ${CMAKE_EXTRACONF}
  }

  do_compile() {


// Robert

> 
> Ross
> 

