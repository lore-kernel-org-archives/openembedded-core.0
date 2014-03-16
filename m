Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB3F6F4E5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 23:01:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2GMxgSa013401; Sun, 16 Mar 2014 23:01:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dNKkwALpU8pJ; Sun, 16 Mar 2014 23:01:21 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2GN1H4o013440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 16 Mar 2014 23:01:18 GMT
Message-ID: <1395010872.3808.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Sun, 16 Mar 2014 23:01:12 +0000
In-Reply-To: <1394717224-15283-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1394717224-15283-1-git-send-email-ricardo.ribalda@gmail.com>
	<1394717224-15283-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] package_deb: Use apt-ftparchive
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
X-List-Received-Date: Sun, 16 Mar 2014 23:01:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-13 at 14:27 +0100, Ricardo Ribalda Delgado wrote:
> Use apt-ftparchive to create a Release file compatible with SecureApt.
> 
> apt-ftparchive is not compatible with libpseudo. The calls to ftw()
> returns the path in absolute format instead of relative. This produces
> wrong Packages and Release files.
> 
> ie:
> MD5Sum:
> d20227a958f6870137ce0e41b7b84307             1453
> /home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/all/Release
> 
> This is why it is called with PSEUDO_UNLOAD.
> 
> apt-ftparchive is also a more efficient replacement of dpkg-scanpackages:
> 
> root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
> _64# time PSEUDO_UNLOAD=1 apt-ftparchive packages . >/tmp/kkk
> real 0m26.873s
> user 0m20.968s
> sys 0m1.212s
> 
> root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
> _64# time PSEUDO_UNLOAD=1 dpkg-scanpackages . >/tmp/kkk
> dpkg-scanpackages: info: Wrote 6022 entries to output Packages file.
> real 0m59.721s
> user 0m16.668s
> sys 0m11.164s
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/classes/package_deb.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This doesn't apply against master? What was this tested against?

Cheers,

Richard


