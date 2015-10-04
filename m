Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF897770E6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Oct 2015 02:59:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t942xUsK002735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 3 Oct 2015 19:59:31 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 3 Oct 2015 19:59:30 -0700
Message-ID: <56109610.8010306@windriver.com>
Date: Sun, 4 Oct 2015 10:59:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <1443846967-40083-1-git-send-email-liezhi.yang@windriver.com>
	<CABcZANne7zN_TfeKET3wcmK8xM6KL9oUOSXazGfqaNGMZr8VAg@mail.gmail.com>
	<CABcZANmVOTOAgvfSrsQVi9-1eQ5q4p+f+7dFcWVAdCrJaNS-=g@mail.gmail.com>
In-Reply-To: <CABcZANmVOTOAgvfSrsQVi9-1eQ5q4p+f+7dFcWVAdCrJaNS-=g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [YP 2.1] [RFC PATCH] insane.bbclass: check files under /etc/ are marked by CONFFILES
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
X-List-Received-Date: Sun, 04 Oct 2015 02:59:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/04/2015 02:40 AM, Christopher Larson wrote:
>
> On Sat, Oct 3, 2015 at 11:39 AM, Christopher Larson <clarson@kergoth.com
> <mailto:clarson@kergoth.com>> wrote:
>
>     On Fri, Oct 2, 2015 at 9:36 PM, Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>> wrote:
>
>         +QAPATHTEST[conffiles] = "package_qa_check_conffiles"
>         +def package_qa_check_conffiles(path, name, d, elf, messages):
>         +    """ Check files in ${sysconfdir} are marked by CONFFILES """
>         +
>         +    if os.path.islink(path) or not os.path.exists(path):
>         +        return True
>         +
>         +    sysconfdir = d.getVar('sysconfdir', True)
>         +    dest = d.getVar('PKGDEST', True)
>         +    sysconfdir_path = os.path.join(os.path.join(dest, name), \
>         +                        sysconfdir.lstrip('/'))
>         +
>         +    if not path.startswith(sysconfdir_path):
>         +        return True
>
>
>     This is missing a trailing slash, so e.g. checking /etcfoo would match, not
>     just /etc. Whenever you use startswith() on a path, remember to append '/'
>     or os.sep to the string being checked
>
>
> To clarify, os.sep needs adding to sysconfdir_path, not path :) I realized my
> wording was ambiguous.

Thanks, after a world testing, there 187 binary rpm packages have this issue
(have /etc/foo, but no CONFFILES set), how about we do this as Debian:
1) Treat all the files under /etc/ as CONFFILES
2) Move the files out or /etc/ if it is not a conffile
3) If the file /etc/foo is a conffile, and is changed during runtime,
    then create a symlink /etc/foo -> /var/foo

// Robert

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

