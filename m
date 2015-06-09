Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B6E2865C78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 07:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t597YtdS004818; Tue, 9 Jun 2015 08:34:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fe47NEQQtWfX; Tue,  9 Jun 2015 08:34:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t597Ygkp004799
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 9 Jun 2015 08:34:54 +0100
Message-ID: <1433835282.28975.118.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Tue, 09 Jun 2015 08:34:42 +0100
In-Reply-To: <CABcZANmPrTTK1KCCmmauYDak9tK1mA3xaxt0Kkc31pphe85NgA@mail.gmail.com>
References: <1433802492.28975.112.camel@linuxfoundation.org>
	<CABcZANmPrTTK1KCCmmauYDak9tK1mA3xaxt0Kkc31pphe85NgA@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Add eventhandler which cleans up stale recipe data
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
X-List-Received-Date: Tue, 09 Jun 2015 07:34:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-06-08 at 21:36 -0500, Christopher Larson wrote:
> On Mon, Jun 8, 2015 at 5:28 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         +    for a in d.getVar("SSTATE_ARCHS", True).split():
>         +        toremove = []
>         +        i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
>         +        if not os.path.exists(i):
>         +            continue
>         +        with open(i, "r") as f:
>         +            lines = f.readlines()
>         +            for l in lines:
>         +                (stamp, manifest, workdir) = l.split()
>         +                if stamp not in stamps:
>         +                    toremove.append(l)
>         +                    if stamp not in seen:
>         +                        bb.note("Stamp %s is not reachable,
>         removing related manifests" % stamp)
>         +                        seen.append(stamp)
>         +        for r in toremove:
>         +            (stamp, manifest, workdir) = r.split()
>         +            for m in glob.glob(manifest + ".*"):
>         +                sstate_clean_manifest(m, d)
>         +            bb.utils.remove(stamp + "*")
>         +            if removeworkdir:
>         +                bb.utils.remove(workdir, recurse = True)
>
> This looks like it’ll solve a lot of headaches for folks.
>  
> Should the removal of workdir bit be outside the ‘for r in toremove’
> block?

I don't think so since each item in toremove may have a different
workdir?

Cheers,

Richard



