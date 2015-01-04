Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id BF52F72453
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 09:09:59 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 3592966727
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 10:09:57 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 10:09:57 +0100 (CET)
Message-ID: <54A90364.6060906@topic.nl>
Date: Sun, 04 Jan 2015 10:09:56 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1420337434.git.Qi.Chen@windriver.com>
	<24dbafa66cc993d1b626ae27ea3e462c0af54718.1420337434.git.Qi.Chen@windriver.com>
In-Reply-To: <24dbafa66cc993d1b626ae27ea3e462c0af54718.1420337434.git.Qi.Chen@windriver.com>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Subject: Re: [PATCH 3/3] libsm: remove dependency on e2fsprogs
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
X-List-Received-Date: Sun, 04 Jan 2015 09:10:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2015 03:11 AM, Chen Qi wrote:
> This patch is to solve the following circular dependency problem.
>
>       systemd -> dbus -> libsm -> e2fsprogs -> util-linux -> systemd
>
> libsm doesn't have any dependency on e2fsprogs. It might be some dependency
> on util-linux's libuuid, controlled by configure options. So e2fsprogs should
> be removed from the DEPENDS variable.
>
> Ideally, we should add a PACKAGECONFIG for 'libuuid' for libsm. However, if
> libsm depends on util-linux, we would have the circular dependency described
> above. That's why this patch explicitly set '--without-libuuid' in EXTRA_OECONF.
> libsm would still be working well because it would fall back to an internal
> algorithm to do the uuid stuff.

Maybe libuuid should get its own recipe. It can be built from the 
util-linux sources. Other packages can then just depend on that libuuid 
recipe instead of util-linux itself.

Only problem would be util-linux I guess, you'd get two providers for 
libuuid.

-- 
Mike Looijmans

