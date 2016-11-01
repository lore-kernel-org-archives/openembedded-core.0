Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8BC60111
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 10:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA1A9eit008128; Tue, 1 Nov 2016 10:09:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id atv6MN3M1WHQ; Tue,  1 Nov 2016 10:09:40 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uA1A9cW5008124
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Nov 2016 10:09:39 GMT
Message-ID: <1477994978.23123.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Nov 2016 10:09:38 +0000
In-Reply-To: <bc402b553331b622af35b7fea7d30d82c7f2f686.1477928374.git.liezhi.yang@windriver.com>
References: <cover.1477928374.git.liezhi.yang@windriver.com>
	<bc402b553331b622af35b7fea7d30d82c7f2f686.1477928374.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] oe/copy_buildsystem.py: dereference symlink
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
X-List-Received-Date: Tue, 01 Nov 2016 10:09:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-31 at 08:48 -0700, Robert Yang wrote:
> When there is a relative symlink in the layer, for example:
> symA -> ../out/of/layer/file
> 
> symA will be invalid fater copied, it would be invalid from build
> time
> if it points to a relative path, and would be invalid after extracted
> the sdk if it points to a absolute py. Dereference symlink when copy
> will fix the problem.
> 
> Use tar rather than shutil.copytree() to copy is because:
> 1) shutil.copytree(symlinks=Fasle) has bugs when dereference
> symlinks:
>    https://bugs.python.org/issue21697
>    And Ubunutu 1404 doesn't upgrade python3 to fix the problem.
> 
> 2) shutil.copytree(symlinks=False) raises errors when there is a
> invalid
>    symlink, and tar just prints a warning, tar is preferred here
> since
>    the real world is unpredicatable
> 
> 3) tar is faster than shutil.copytree() as said by oe.path.copytree()

Could we just use oe.path.copytree() here?

Cheers,

Richard

