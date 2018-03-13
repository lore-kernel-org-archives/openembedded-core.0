Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 30C3B78918
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 14:57:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2DEvAuk030897
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Mar 2018 14:57:13 GMT
Message-ID: <1520953029.25754.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 07:57:09 -0700
In-Reply-To: <b99839985653f44516cf41291681f2f5cbf63a7e.1520911259.git.liezhi.yang@windriver.com>
References: <cover.1520911259.git.liezhi.yang@windriver.com>
	<b99839985653f44516cf41291681f2f5cbf63a7e.1520911259.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 7/8] populate_sdk_ext.bbclass: remove the try...finally
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
X-List-Received-Date: Tue, 13 Mar 2018 14:57:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-03-13 at 11:24 +0800, Robert Yang wrote:
> The "sdkbasepath + '/conf/local.conf.bak" doesn't exist when
> "oe.copy_buildsystem.check_sstate_task_list()" fails, then
> os.replace() would
> raise FileNotFoundError, which overcomes the real error. Keep the
> error status
> makes debug easier, so remove the try..finally.

I don't think this patch is quite right. If there is a failure we
*must* make sure local.conf is restored, that is important. The code
should probably keep the try/finally but make the replace conditional
on the file existing.

Cheers,

Richard

