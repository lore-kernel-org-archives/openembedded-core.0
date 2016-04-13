Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 47EA960119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 11:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DBS0iO004432; Wed, 13 Apr 2016 12:28:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9b8mBKXY5WTn; Wed, 13 Apr 2016 12:27:59 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DBRuku004429
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Apr 2016 12:27:57 +0100
Message-ID: <1460546876.9308.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fabio.berton@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 12:27:56 +0100
In-Reply-To: <CAAPZna383bo4guwTc5a8dfaLuATyaTvULmyyZngfDtQiOjtB=Q@mail.gmail.com>
References: <CAAPZna383bo4guwTc5a8dfaLuATyaTvULmyyZngfDtQiOjtB=Q@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: userdel_sysroot_sstate failed when try to remove group
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
X-List-Received-Date: Wed, 13 Apr 2016 11:28:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-04-08 at 14:19 -0300, Fabio Berton wrote:
> I'm getting this error when building recipe meta-networking/recipes
> -daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> from meta-openembedded:
> 
> DEBUG: Executing shell function userdel_sysroot_sstate
> NOTE: cyrus-sasl: Performing userdel with [--root
> /home/user/src/prj/build/tmp/sysroots/intel-core2-32 cyrus]
> NOTE: cyrus-sasl: user cyrus doesn't exist, not removing it
> NOTE: cyrus-sasl: Performing groupdel with [--root
> /home/user/src/prj/build/tmp/sysroots/intel-core2-32 mail]
> groupdel: cannot remove the primary group of user 'mail'
> WARNING: exit code 1 from a shell command.
> ERROR: cyrus-sasl: groupdel command did not succeed.
> DEBUG: Python function sysroot_cleansstate finished
> ERROR: Function failed: userdel_sysroot_sstate
> 
> The function userdel_sysroot_sstate was introduced by commit:
> http://cgit.openembedded.org/openembedded-core/commit/?id=b5304ce4386
> 66a7418746f4ddd32703ae3188089
> 
> This error occurs on the first build of cyrus-sasl recipe, and I
> didn't run
> cleansstate any time. userdel_sysroot_sstate is trying to remove user
> and group before they are created.
> 
> As temporary solution I commented line SSTATECLEANFUNCS =
> "userdel_sysroot_sstate"
> in useradd.bbclass file.

Firstly, I do agree that we could use better error messages for this.

I believe the problem is the cyrus-sasl is trying to create a "mail"
group when the base-passwd file already creates such a group. If that
group creation is removed, does the recipe work again?

Cheers,

Richard

