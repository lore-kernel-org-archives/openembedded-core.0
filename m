Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE3E871C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 11:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9KBbbvo001473; Thu, 20 Oct 2016 12:38:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ho-_lMhzfNNj; Thu, 20 Oct 2016 12:38:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9KBc0eP001713
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Oct 2016 12:38:01 +0100
Message-ID: <1476963480.2166.116.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kukkonen Jussi <jussi.kukkonen@intel.com>, Jianxun Zhang
	<jianxun.zhang@intel.com>, "Witt, Randy E" <randy.e.witt@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2016 12:38:00 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Performance tweaks in 2.2
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
X-List-Received-Date: Thu, 20 Oct 2016 11:38:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been distracted with ELC-E and other travel but I wanted to
recognise some good work people have done on the performance front. We
identified a few issues recently:

a) pseudo slowed down after upgrading sqlite
b) we were using more space on disk (without rm_work)
c) eSDK installation times had increased.

At the end of this email I've included some raw data from the
performance test scripts. The bottom line is that with the sqlite
regression fixed, we gained around 40s on builds and probably sped up
the SDK installation. Thanks to Jianxun Zhang for that! SDK install
times are down from 6 minutes to under 4 minutes, thanks Randy Witt.
Jussi Kukkonen also found a vala dependency issue which was bloating
the build footprint by ~200MB and makes another nice saving. Keeping an
eye on this does therefore make a difference and lots of small tweaks
do mount up.

We're still slightly slower than 2.1, mostly due to gcc6 being slower
and python3 but its better than it was and we at least have tracked
down some of the things we can fix.

Cheers,

Richard

ypperf01,master:4a7eb4b92f32c17abd1111246b1acb9ad3daa355,uninative-1.4-325-g4a7eb4b,1:02:07,5:25.86,1:01:40,2:12.83,0:22.00,0:14.10,0:01.41,6:13.62,27054256,6537360,1472032,5427480
ypperf01,master:4a7eb4b92f32c17abd1111246b1acb9ad3daa355,uninative-1.4-325-g4a7eb4b,1:01:49,5:09.28,1:01:42,2:15.94,0:21.76,0:13.92,0:01.40,6:00.89,27051928,6537780,1472099,5427293
ypperf01,master:371ab635086e2878ada1f00a59c7ec826481ba0a,uninative-1.4-336-g371ab63,1:01:26,5:24.22,1:01:03,2:19.99,0:21.90,0:13.89,0:01.40,4:01.59,26812292,6500116,1458046,5370670
ypperf01,master:371ab635086e2878ada1f00a59c7ec826481ba0a,uninative-1.4-336-g371ab63,1:01:44,5:17.25,1:01:06,2:15.32,0:21.69,0:13.92,0:01.40,4:08.56,26823976,6499596,1458073,5370487
ypperf01,master:371ab635086e2878ada1f00a59c7ec826481ba0a,uninative-1.4-336-g371ab63,1:01:23,5:12.44,1:01:05,2:13.34,0:21.76,0:13.90,0:01.40,3:39.52,26816852,6499488,1458115,5370793
ypperf01,master:371ab635086e2878ada1f00a59c7ec826481ba0a,uninative-1.4-336-g371ab63,1:01:46,5:17.09,1:01:00,2:15.86,0:21.96,0:13.92,0:01.40,4:04.50,26811936,6497088,1457894,5370346
ypperf01,master:371ab635086e2878ada1f00a59c7ec826481ba0a,uninative-1.4-336-g371ab63,1:01:34,5:18.91,1:00:59,2:15.79,0:21.78,0:14.05,0:01.40,4:09.91,26816384,6497648,1457999,5370616
ypperf01,master:1a95d4a0701b87ae3674239a01aabe38a0123585,uninative-1.4-346-g1a95d4a,1:01:38,5:27.56,1:01:00,2:21.27,0:21.70,0:14.04,0:01.41,4:04.72,26816544,6499532,1458323,5370863
ypperf01,master:1a95d4a0701b87ae3674239a01aabe38a0123585,uninative-1.4-346-g1a95d4a,1:01:48,5:20.29,1:00:56,2:16.08,0:21.61,0:14.05,0:01.41,4:06.23,26826764,6500292,1458171,5370743
ypperf01,master:1a95d4a0701b87ae3674239a01aabe38a0123585,uninative-1.4-346-g1a95d4a,1:01:36,5:25.49,1:00:59,2:19.05,0:21.60,0:13.87,0:01.42,3:38.40,26814108,6497312,1457942,5370509
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:00:59,5:19.19,1:00:35,2:14.68,0:21.77,0:14.33,0:01.39,3:36.02,26828336,6497892,1457145,5370760
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:01:50,5:18.24,1:00:35,2:16.83,0:21.81,0:13.91,0:01.40,3:53.10,26833824,6500176,1457163,5371140
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:00:55,5:26.70,1:00:37,2:18.80,0:21.77,0:14.42,0:01.44,3:38.64,26841844,6498064,1456913,5370820
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:01:32,5:18.06,1:00:43,2:13.04,0:21.74,0:13.87,0:01.46,3:35.51,26842136,6497512,1456923,5370729
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:01:19,5:18.47,1:00:38,2:15.66,0:21.82,0:14.01,0:01.38,4:01.61,26841484,6499732,1457031,5371460
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:01:09,5:22.56,1:00:30,2:19.35,0:21.63,0:14.40,0:01.40,3:39.52,26834712,6497980,1457219,5371030
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:01:12,5:26.70,1:00:30,2:15.65,0:21.83,0:14.13,0:01.41,3:59.26,26841808,6498064,1456963,5371080
ypperf01,master:4b94b498e21aeba945fe7e72a6b7c4bb0314fb83,uninative-1.4-388-g4b94b49,1:01:21,5:23.43,1:00:33,2:16.72,0:21.66,0:13.88,0:01.40,3:57.87,26840848,6499668,1457025,5371499
ypperf01,master:9c04beb9adf5ed05b4fe89322bfa4dd60296de2b,uninative-1.4-397-g9c04beb,1:01:16,5:19.50,1:00:37,2:13.59,0:21.59,0:14.09,0:01.41,3:42.41,26841920,6497844,1457035,5370762

